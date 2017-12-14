// bbb.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "bbb.h"
#include "bbbDlg.h"
#include "DlgLogin.h"
#include "PrintDoc.h"
#include "PrintFram.h"
#include "PrintView.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CBbbApp

BEGIN_MESSAGE_MAP(CBbbApp, CWinApp)
	//{{AFX_MSG_MAP(CBbbApp)
	//}}AFX_MSG_MAP

END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBbbApp construction

CBbbApp::CBbbApp()
{

}
/////////////////////////////////////////////////////////////////////////////
// The one and only CBbbApp object

CBbbApp theApp;

_ConnectionPtr m_pCon;  //ADO连接对象
_RecordsetPtr m_pRs; 
_RecordsetPtr m_pRs1;
_CommandPtr m_pCom;

BOOL Flag = FALSE; //登录标识
CString user,password;//记录当前用户

CReport report;
/////////////////////////////////////////////////////////////////////////////
// CBbbApp initialization

BOOL CBbbApp::InitInstance()
{
	AfxOleInit(); 
	AfxEnableControlContainer();

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when lInking to MFC statically
#endif
	m_mainfram = NULL;
	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CPrintDoc),
		RUNTIME_CLASS(CPrintFram),       // main SDI frame window
		RUNTIME_CLASS(CPrintView));
	AddDocTemplate(pDocTemplate);
	IniAdo();
	CDlgLogin login ;
	login.DoModal();
	if (Flag ==true)
	{
		CBbbDlg dlg;
		m_pMainWnd = &dlg;
		dlg.DoModal();		
	}
	return FALSE;
}

void CBbbApp::IniAdo()
{
	try
	{
		CString strAdoConn;
		strAdoConn.Format("driver={SQL Server};SERVER=.;UID=sa;DATABASE=BookManage");
		m_pCon.CreateInstance(_uuidof(Connection));
		m_pCon->ConnectionString = (_bstr_t)strAdoConn;
		m_pCon->Open("","","",NULL);
		m_pCom.CreateInstance("ADODB.Command");
		m_pRs.CreateInstance(_uuidof(Recordset));	
		m_pRs1.CreateInstance(_uuidof(Recordset));
	}
	catch(_com_error)
	{		
		Flag = FALSE;
		MessageBox(0,"请检查系统配置信息", "数据库连接失败",MB_OK);		
		return;
	}
	catch(...)
	{	
		AfxMessageBox("SYS Error");
		return ;
	}
}

