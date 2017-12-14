// bbbDlg.cpp : implementation file
//

#include "stdafx.h"
#include "bbb.h"
#include "bbbDlg.h"
//#include "ADOConn.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern BOOL Flag ; 

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About
extern CBbbApp theApp;
extern _ConnectionPtr m_pCon;  //ADO连接对象
extern _RecordsetPtr m_pRs; 
class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBbbDlg dialog

CBbbDlg::CBbbDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CBbbDlg::IDD, pParent)
{
	pdlgBaseInfoM = NULL;
	pdlgStoreInfoM = NULL;
	pdlgQueryM = NULL;



	//{{AFX_DATA_INIT(CBbbDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);//IDR_MAINFRAME);
}

void CBbbDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CBbbDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CBbbDlg, CDialog)
	//{{AFX_MSG_MAP(CBbbDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()	
	ON_WM_QUERYDRAGICON()
	ON_WM_DRAWITEM()
	ON_WM_MEASUREITEM()
	ON_COMMAND(ID_OPERATOR_M, OnOperatorM)
	ON_COMMAND(IDD_ABOUTBOX, OnAboutbox)
	ON_COMMAND(ID_BOOK_INFO, OnBookInfo)
	ON_COMMAND(ID_PROVIDER_INFO, OnProviderInfo)
	ON_COMMAND(ID_BOOK_TYPE, OnBookType)
	ON_COMMAND(ID_CK_INFO, OnCkInfo)
	ON_COMMAND(ID_DESK_INFO, OnDeskInfo)
	ON_COMMAND(ID_BOOK_INPUT, OnBookInput)
	ON_COMMAND(ID_BOOK_PRICE, OnBookPrice)
	ON_COMMAND(ID_BOOK_PRICE_ADJUST, OnBookPriceAdjust)
	ON_COMMAND(ID_INPUT_BACK, OnInputBack)
	ON_COMMAND(ID_BOOK_ADJUST, OnBookAdjust)
	ON_COMMAND(ID_SALE_M, OnSaleM)
	ON_COMMAND(ID_SALE_BACK, OnSaleBack)
	ON_COMMAND(ID_INPUT_QUERY, OnInputQuery)
	ON_COMMAND(ID_INPUT_BACK_QUERY, OnInputBackQuery)
	ON_COMMAND(ID_SALE_QUERY, OnSaleQuery)
	ON_COMMAND(ID_SALE_BACK_QUERY, OnSaleBackQuery)
	ON_BN_CLICKED(IDC_BUTTON8, OnButton8)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBbbDlg message handlers

BOOL CBbbDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.
//	AdoInit();
	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_menu.AttachMenu(GetMenu()->GetSafeHmenu(),CSize(16,15));
	if(!m_ToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP   
		| CBRS_TOOLTIPS |CBRS_FLYBY | CBRS_SIZE_DYNAMIC))
	{
		return FALSE;      
	}
	CImageList ImageList;	
	//设置图标
	ImageList.Create(32, 32, ILC_COLOR24|ILC_MASK,2,2);
	//ImageList.SetBkColor(RGB(255, 176, 55));//::GetSysColor(COLOR_WINDOW)
	ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON1)); 
    ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON2));  	
    ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON3));     
	ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON4));
	ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON5));  	
    ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON6));     
	ImageList.Add(AfxGetApp()->LoadIcon(IDI_ICON7));
	m_ToolBar.GetToolBarCtrl().SetImageList(&ImageList);
	ImageList.Detach();
	m_ToolBar.SetButtons(NULL, 10); //共10个按钮
	// 设置每个工具按钮文字
	m_ToolBar.SetButtonInfo(0, ID_BOOK_INFO, TBSTYLE_BUTTON, 0);
	m_ToolBar.SetButtonText(0, "图书信息");
	m_ToolBar.SetButtonInfo(1, ID_OPERATOR_M, TBSTYLE_BUTTON , 1);
	m_ToolBar.SetButtonText(1, "用户信息");
	m_ToolBar.SetButtonInfo(2, ID_SEPARATOR, TBBS_SEPARATOR , 1);
	m_ToolBar.SetButtonInfo(3, ID_BOOK_INPUT, TBSTYLE_BUTTON, 2);
	m_ToolBar.SetButtonText(3, "图书入库");
	m_ToolBar.SetButtonInfo(4, ID_SALE_M, TBSTYLE_BUTTON , 3);
	m_ToolBar.SetButtonText(4, "图书销售");
	m_ToolBar.SetButtonInfo(5, ID_SEPARATOR, TBBS_SEPARATOR , 5);
	m_ToolBar.SetButtonInfo(6, ID_INPUT_QUERY, TBSTYLE_BUTTON , 4);
	m_ToolBar.SetButtonText(6, "入库查询");
	m_ToolBar.SetButtonInfo(7, ID_SALE_QUERY, TBSTYLE_BUTTON, 5);
	m_ToolBar.SetButtonText(7, "销售查询");
	m_ToolBar.SetButtonInfo(8, ID_SEPARATOR, TBBS_SEPARATOR , 6);//
	m_ToolBar.SetButtonInfo(9, IDCANCEL, TBSTYLE_BUTTON, 6);
	m_ToolBar.SetButtonText(9, "退出系统");
	m_ToolBar.SetSizes(CSize(60,60), CSize(32,32)); //设置按钮的大小
	
	m_Rebar.Create(this);	
	//将向导生成的工具栏做目标工具栏
	m_Rebar.AddBar(&m_ToolBar);
	m_Rebar.RedrawWindow();
	REBARBANDINFO info;
	info.cbSize = sizeof(info);
	info.fMask = RBBIM_BACKGROUND;
	m_ToolBar.ModifyStyle(0,TBSTYLE_TRANSPARENT);
	info.hbmBack = LoadBitmap(AfxGetInstanceHandle(),MAKEINTRESOURCE(IDB_BITMAP3));
	m_Rebar.GetReBarCtrl().SetBandInfo(0,&info);
	RepositionBars(AFX_IDW_CONTROLBAR_FIRST, AFX_IDW_CONTROLBAR_LAST, 0);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CBbbDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CBbbDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CBbbDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CBbbDlg::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct) 
{
	// TODO: Add your message handler code here and/or call default
	m_menu.DrawItem(lpDrawItemStruct);
	CDialog::OnDrawItem(nIDCtl, lpDrawItemStruct);
}

void CBbbDlg::OnMeasureItem(int nIDCtl, LPMEASUREITEMSTRUCT lpMeasureItemStruct) 
{
	// TODO: Add your message handler code here and/or call default
	m_menu.MeasureItem(lpMeasureItemStruct);
	CDialog::OnMeasureItem(nIDCtl, lpMeasureItemStruct);
}

void CBbbDlg::OnOperatorM() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(0);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;	
}

void CBbbDlg::OnAboutbox() 
{
	// TODO: Add your command handler code here
	CAboutDlg dlg;
	dlg.DoModal();
	
}

void CBbbDlg::OnBookInfo() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(1);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
}

void CBbbDlg::OnProviderInfo() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(2);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
	
}

void CBbbDlg::OnBookType() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(3);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
	
}

void CBbbDlg::OnCkInfo() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(4);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
	
}

void CBbbDlg::OnDeskInfo() 
{
	// TODO: Add your command handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(5);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
	
}

void CBbbDlg::OnBookInput() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(0);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnBookPrice() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(1);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnBookPriceAdjust() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(2);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnInputBack() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(3);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnBookAdjust() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(4);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnSaleM() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(5);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnSaleBack() 
{
	// TODO: Add your command handler code here
	pdlgStoreInfoM = new CDlgStoreInfoM(6);
	pdlgStoreInfoM->DoModal();
	delete pdlgStoreInfoM;
	
}

void CBbbDlg::OnInputQuery() 
{
	// TODO: Add your command handler code here
	pdlgQueryM = new CDlgQueryM(0);
	pdlgQueryM->DoModal();
	delete pdlgQueryM;
	
}

void CBbbDlg::OnInputBackQuery() 
{
	// TODO: Add your command handler code here
	pdlgQueryM = new CDlgQueryM(1);
	pdlgQueryM->DoModal();
	delete pdlgQueryM;
	
}

void CBbbDlg::OnSaleQuery() 
{
	// TODO: Add your command handler code here
	pdlgQueryM = new CDlgQueryM(2);
	pdlgQueryM->DoModal();
	delete pdlgQueryM;
	
}

void CBbbDlg::OnSaleBackQuery() 
{
	// TODO: Add your command handler code here
	pdlgQueryM = new CDlgQueryM(3);
	pdlgQueryM->DoModal();
	delete pdlgQueryM;
	
}

void CBbbDlg::OnButton8() 
{
	// TODO: Add your control notification handler code here
	pdlgBaseInfoM = new CDlgBaseInfoM(0);
	pdlgBaseInfoM->DoModal();
	delete pdlgBaseInfoM;
	//enum
}

void CBbbDlg::OnOK()
{

}

void CBbbDlg::OnCancel()
{
	CDialog::OnCancel();
}
