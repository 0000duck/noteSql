#if !defined(AFX_DLGSTOREINFOM_H__C36BB0C8_9E3B_436D_AC35_1B6D46C3D02D__INCLUDED_)
#define AFX_DLGSTOREINFOM_H__C36BB0C8_9E3B_436D_AC35_1B6D46C3D02D__INCLUDED_
#include "TabSheet.h"
#include "DlgBookInput2.h"
#include "DlgBookPrice2.h"
#include "DlgBookAdjustPrice2.h"
#include "DlgInputBack2.h"
#include "DlgBookAdjust2.h"
#include "DlgBookSale2.h"
#include "DlgSaleBack2.h"
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgStoreInfoM.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgStoreInfoM dialog

class CDlgStoreInfoM : public CDialog
{
// Construction
public:
	int nSelect;
	CDlgBookInput2        m_dlg1;
	CDlgBookPrice2        m_dlg2;
	CDlgBookAdjustPrice2  m_dlg3;
	CDlgBookAdjust2     m_dlg5;
	CDlgInputBack2     m_dlg4;
	CDlgBookSale2      m_dlg6;
	CDlgSaleBack2      m_dlg7;

	CDlgStoreInfoM(CWnd* pParent = NULL);   // standard constructor
	CDlgStoreInfoM(int iSelect, CWnd* pParent = NULL);

// Dialog Data
	//{{AFX_DATA(CDlgStoreInfoM)
	enum { IDD = IDD_STORE_INFO_M };
	CTabSheet	m_tab;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgStoreInfoM)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgStoreInfoM)
	virtual BOOL OnInitDialog();
	afx_msg void OnButAdd();    //Ôö¼ÓÃüÁî
	afx_msg void OnButDel();    //É¾³ýÃüÁî
	afx_msg void OnButExit();   //ÍË³ö
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGSTOREINFOM_H__C36BB0C8_9E3B_436D_AC35_1B6D46C3D02D__INCLUDED_)
