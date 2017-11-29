#if !defined(AFX_DLGQUERYM_H__C63F2A26_E92A_40FD_AAF1_00ADF092BF83__INCLUDED_)
#define AFX_DLGQUERYM_H__C63F2A26_E92A_40FD_AAF1_00ADF092BF83__INCLUDED_
#include "TabSheet.h"
#include "DlgInputQuery3.h"
#include "DlgInputBackQuery3.h"
#include "DlgSaleQuery3.h"
#include "DlgSaleBackQuery3.h"
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgQueryM.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgQueryM dialog

class CDlgQueryM : public CDialog
{
// Construction
public:
	void OnCancel();
	int nSelect;
	CDlgInputQuery3		 m_dlg1;
	CDlgInputBackQuery3  m_dlg2;
	CDlgSaleQuery3        m_dlg3;;
	CDlgSaleBackQuery3    m_dlg4;
	CDlgQueryM(CWnd* pParent = NULL);   // standard constructor
	CDlgQueryM(int iSelect, CWnd* pParent = NULL);

// Dialog Data
	//{{AFX_DATA(CDlgQueryM)
	enum { IDD = IDD_QUERY_M };
	CTabSheet	m_tab;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgQueryM)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgQueryM)
	virtual BOOL OnInitDialog();
	afx_msg void OnButquery();
	afx_msg void OnButcancel();
	afx_msg void OnButprint();
	afx_msg void OnButexit();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGQUERYM_H__C63F2A26_E92A_40FD_AAF1_00ADF092BF83__INCLUDED_)
