// DlgBaseInfoM.cpp : implementation file
//

#include "stdafx.h"
#include "bbb.h"
#include "DlgBaseInfoM.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgBaseInfoM dialog


CDlgBaseInfoM::CDlgBaseInfoM(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgBaseInfoM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgBaseInfoM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	nSelect = -1;
}

CDlgBaseInfoM::CDlgBaseInfoM(int iSelect, CWnd* pParent /*=NULL*/)
	: CDialog(CDlgBaseInfoM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgBaseInfoM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	nSelect = iSelect;
}



void CDlgBaseInfoM::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgBaseInfoM)
	DDX_Control(pDX, IDC_TAB1, m_tab);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgBaseInfoM, CDialog)
	//{{AFX_MSG_MAP(CDlgBaseInfoM)
	ON_COMMAND(IDC_BUTADD, OnButAdd)
	ON_COMMAND(IDC_BUTMOD, OnButMod)
	ON_COMMAND(IDC_BUTDEL, OnButDel)
	ON_COMMAND(IDC_BUTEXIT, OnButExit)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgBaseInfoM message handlers

BOOL CDlgBaseInfoM::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_tab.AddPage("用户信息",     &m_dlg1, IDD_OPERATOR1);
	m_tab.AddPage("图书信息",   &m_dlg2, IDD_BOOK_INFO1);
	m_tab.AddPage("供应商信息", &m_dlg3, IDD_PROVIDER_INFO1);
	m_tab.AddPage("图书种类", &m_dlg4, IDD_BOOK_KINDS1);
	m_tab.AddPage("仓库信息", &m_dlg5, IDD_STORE_INFO1);
	m_tab.AddPage("柜台信息", &m_dlg6, IDD_DESK_INOF1);
	if (nSelect >= 0)
		m_tab.Show(nSelect);
	else
		m_tab.Show();
	return TRUE;  // return TRUE unless you set the focus to a control
}

void CDlgBaseInfoM::OnButAdd()
{
	int cur = m_tab.GetCurSel();	
	switch (cur)
	{
		case 0:
		{
			m_dlg1.AddOperator();
			break;
		}
		case 1: 
		{
			m_dlg2.AddBookInfo();
			break;
		}
		case 2: 
		{
			m_dlg3.AddProvider();
			break;
		}
		case 3: 
		{
			m_dlg4.AddBookKind();
			break;
		}
		case 4: 
		{
			m_dlg5.AddStorageInfo();
			break;
		}
		case 5: 
		{
			m_dlg6.AddCounterInfo();
			break;
		}
	}
}

void CDlgBaseInfoM::OnButMod()
{
	int cur = m_tab.GetCurSel();	
	switch (cur)
	{
		case 0:
		{
			m_dlg1.UpdateOperator();
			break;
		}
		case 1: 
		{
			m_dlg2.UpdateBookInfo();
			break;
		}
		case 2: 
		{
			m_dlg3.UpdateProvider();
			break;
		}
		case 3: 
		{
			m_dlg4.UpdateBookKind();
			break;
		}
		case 4: 
		{
			m_dlg5.UpdateStorageInfo();
			break;
		}
		case 5: 
		{
			m_dlg6.UpdateCounterInfo();
			break;
		}
	}
}

void CDlgBaseInfoM::OnButDel()
{
	int cur = m_tab.GetCurSel();	
	switch (cur)
	{
		case 0:
		{
			m_dlg1.DeleteOperator();
			break;
		}
		case 1: 
		{
			m_dlg2.DeleteBookInfo();
			break;
		}
		case 2: 
		{
			m_dlg3.DeleteProvider();
			break;
		}
		case 3: 
		{
			m_dlg4.DeleteBookKind();
			break;
		}
		case 4: 
		{
			m_dlg5.DeleteStorageInfo();
			break;
		}
		case 5: 
		{
			m_dlg6.DeleteCounterInfo();
			break;
		}
	}
}

void CDlgBaseInfoM::OnButExit()
{
	m_tab.DestroyWindow();
	CDlgBaseInfoM::OnCancel();
}