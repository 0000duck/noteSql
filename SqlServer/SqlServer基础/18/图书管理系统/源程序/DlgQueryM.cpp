// DlgQueryM.cpp : implementation file
//

#include "stdafx.h"
#include "bbb.h"
#include "DlgQueryM.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgQueryM dialog
extern CBbbApp theApp;

CDlgQueryM::CDlgQueryM(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgQueryM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgQueryM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	nSelect = -1;
}

CDlgQueryM::CDlgQueryM(int iSelect, CWnd* pParent /*=NULL*/)
	: CDialog(CDlgQueryM::IDD, pParent)
{
	nSelect = iSelect;
}


void CDlgQueryM::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgQueryM)
	DDX_Control(pDX, IDC_TAB1, m_tab);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgQueryM, CDialog)
	//{{AFX_MSG_MAP(CDlgQueryM)
	ON_BN_CLICKED(IDC_BUTQUERY, OnButquery)
	ON_BN_CLICKED(IDC_BUTCANCEL, OnButcancel)
	ON_BN_CLICKED(IDC_BUTPRINT, OnButprint)
	ON_BN_CLICKED(IDC_BUTEXIT, OnButexit)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgQueryM message handlers

BOOL CDlgQueryM::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_tab.AddPage("入库查询",     &m_dlg1, IDD_INPUT_QUERY3);
	m_tab.AddPage("入库退货查询", &m_dlg2, IDD_INPUT_BACK_QUERY3);
	m_tab.AddPage("销售查询",     &m_dlg3, IDD_SALE_QUERY3);
	m_tab.AddPage("销售退货查询", &m_dlg4, IDD_SALE_BACK_QUERY3);
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

void CDlgQueryM::OnCancel()
{
	if(theApp.m_mainfram != NULL)
		theApp.m_mainfram->DestroyWindow();	
	m_tab.DestroyWindow();
	CDialog::OnCancel();
}

void CDlgQueryM::OnButquery() 
{
	// TODO: Add your control notification handler code here
	int cur = m_tab.GetCurSel();
	switch (cur)
	{
	case 0:
		{
			m_dlg1.Query();
			break;
		}
	case 1:
		{
			m_dlg2.Query();
			break;
		}
	case 2:
		{
			
			m_dlg3.Query();
			break;
		}
	case 3:
		{
			
			m_dlg4.Query();
			break;
		}
	}
}

void CDlgQueryM::OnButcancel() 
{
	// TODO: Add your control notification handler code here
	int cur = m_tab.GetCurSel();
	switch (cur)
	{
	case 0:
		{
			m_dlg1.CancelQuery();
			break;
		}
	case 1:
		{
			m_dlg2.CancelQuery();
			break;
		}
	case 2:
		{
			
			m_dlg3.CancelQuery();
			break;
		}
	case 4:
		{
			
			m_dlg4.CancelQuery();
			break;
		}	
	}
}

void CDlgQueryM::OnButprint() 
{
	// TODO: Add your control notification handler code here
	int cur = m_tab.GetCurSel();
	switch (cur)
	{
	case 0:
		{
			m_dlg1.Print();
			break;
		}
	case 1:
		{
			m_dlg2.Print();
			break;
		}
	case 2:
		{
			
			m_dlg3.Print();
			break;
		}
	case 3:
		{
			
			m_dlg4.Print();
			break;
		}
	}
}

void CDlgQueryM::OnButexit() 
{
	// TODO: Add your control notification handler code here
	CDlgQueryM::OnCancel();
}
