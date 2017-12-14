// DlgStoreInfoM.cpp : implementation file
//

#include "stdafx.h"
#include "bbb.h"
#include "DlgStoreInfoM.h"
#include "DlgBookAdjust2.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgStoreInfoM dialog


CDlgStoreInfoM::CDlgStoreInfoM(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgStoreInfoM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgStoreInfoM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	nSelect = -1;
}

CDlgStoreInfoM::CDlgStoreInfoM(int iSelect, CWnd* pParent /*=NULL*/)
	: CDialog(CDlgStoreInfoM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgStoreInfoM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	nSelect = iSelect;
}


void CDlgStoreInfoM::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgStoreInfoM)
	DDX_Control(pDX, IDC_TAB1, m_tab);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgStoreInfoM, CDialog)
	//{{AFX_MSG_MAP(CDlgStoreInfoM)
	ON_COMMAND(IDC_BUTADD, OnButAdd)
	ON_COMMAND(IDC_BUTDEL, OnButDel)
	ON_COMMAND(IDC_BUTEXIT, OnButExit)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgStoreInfoM message handlers

BOOL CDlgStoreInfoM::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	m_tab.AddPage("图书入库",  &m_dlg1, IDD_BOOK_INPUT2);
	m_tab.AddPage("图书定价",  &m_dlg2, IDD_BOOK_PRICE2);
	m_tab.AddPage("图书调价",  &m_dlg3, IDD_BOOK_ADJUST_PRICE2);
	m_tab.AddPage("入库退货",  &m_dlg4, IDD_INPUT_BACK2);
	m_tab.AddPage("图书调拨",  &m_dlg5, IDD_BOOK_ADJUST2);
	m_tab.AddPage("图书销售",  &m_dlg6, IDD_BOOK_SALE2);
	m_tab.AddPage("销售退货",  &m_dlg7, IDD_SALE_BACK2);

	if (nSelect >= 0)
	{
		m_tab.Show(nSelect);
	}
	else
	{
		m_tab.Show();
	}	
	
	return TRUE;  
}

void CDlgStoreInfoM::OnButAdd()
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
			m_dlg2.BookFixPrice();
			break;
		}	
	case 2:
		{
			m_dlg3.BookAdjustPrice();
			break;
		}
	case 3:
		{
			m_dlg4.AddOperate();
			break;
		}
	case 4:
		{
			m_dlg5.AddOperate();
			break;
		}
	case 5:
		{
			m_dlg6.AddOperate();
			break;
		}
	case 6:
		{
			m_dlg7.AddOperate();
			break;
		}
	}
}

void CDlgStoreInfoM::OnButDel()
{
	int cur = m_tab.GetCurSel();
	switch (cur) 
	{
	case 0:
		{
			m_dlg1.InputCancel();
			break;
		}
	case 1:
		{
			m_dlg2.CancelOperate();
			break;
		}	
	case 2:
		{
			m_dlg3.CancelOperate();
			break;
		}
	case 3:
		{
			m_dlg4.InputCancel();
			break;
		}
	case 4:
		{
			m_dlg5.CancelOperate();
			break;
		}
	case 5:
		{
			m_dlg6.CancelOperate();
			break;
		}
	case 6:
		{
			m_dlg7.CancelOperate();
			break;
		}
	}
}

void CDlgStoreInfoM::OnButExit()
{
	m_tab.DestroyWindow();
	CDlgStoreInfoM::OnCancel();
}
