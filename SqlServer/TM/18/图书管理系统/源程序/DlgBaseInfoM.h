#if !defined(AFX_DLGBASEINFOM_H__39666A4B_969D_4F63_8E42_D3032F979B0C__INCLUDED_)
#define AFX_DLGBASEINFOM_H__39666A4B_969D_4F63_8E42_D3032F979B0C__INCLUDED_
#include "TabSheet.h"
#include "DlgOperator1.h"
#include "DlgBookInfo1.h"
#include "DlgProviderInfo1.h"
#include "DlgBookKinds1.h"
#include "DlgStoreInfo1.h"
#include "DlgDeskInfo1.h"
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgBaseInfoM.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgBaseInfoM dialog

class CDlgBaseInfoM : public CDialog
{
// Construction
public:
	int nSelect;  //选择的属性页标识
	CDlgOperator1      m_dlg1;
	CDlgBookInfo1      m_dlg2;
	CDlgProviderInfo1  m_dlg3;
	CDlgBookKinds1     m_dlg4;
	CDlgStoreInfo1     m_dlg5;
	CDlgDeskInfo1      m_dlg6;
	
	CDlgBaseInfoM(CWnd* pParent = NULL);   // standard constructor
	CDlgBaseInfoM(int iSelect, CWnd* pParent = NULL);

// Dialog Data
	//{{AFX_DATA(CDlgBaseInfoM)
	enum { IDD = IDD_BASE_INFO_M };
	CTabSheet	m_tab;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgBaseInfoM)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgBaseInfoM)
	virtual BOOL OnInitDialog();	
	afx_msg void OnButAdd();    //增加命令
	afx_msg void OnButMod(); //修改命令
	afx_msg void OnButDel();    //删除命令
	afx_msg void OnButExit();   //退出
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGBASEINFOM_H__39666A4B_969D_4F63_8E42_D3032F979B0C__INCLUDED_)
