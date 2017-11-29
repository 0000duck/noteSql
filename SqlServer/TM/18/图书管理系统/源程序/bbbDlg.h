// bbbDlg.h : header file
//

#if !defined(AFX_BBBDLG_H__196B6212_A7A5_4CCC_92EA_C9F39A7D892F__INCLUDED_)
#define AFX_BBBDLG_H__196B6212_A7A5_4CCC_92EA_C9F39A7D892F__INCLUDED_
#include "MyCoolMenu.h"
#include "DlgBaseInfoM.h"
#include "DlgStoreInfoM.h"
#include "DlgQueryM.h"

#include "DlgLogin.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CBbbDlg dialog

class CBbbDlg : public CDialog
{
public:
	CDlgBaseInfoM  *pdlgBaseInfoM;
	CDlgStoreInfoM *pdlgStoreInfoM;
	CDlgQueryM     *pdlgQueryM;
	CToolBar		m_ToolBar;
	CReBar			m_Rebar;//RebarÌõ
// Construction
public:
	void OnCancel();
	void OnOK();
	CMyCoolMenu m_menu;
	CBbbDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CBbbDlg)
	enum { IDD = IDD_BBB_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CBbbDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CBbbDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();	
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	afx_msg void OnMeasureItem(int nIDCtl, LPMEASUREITEMSTRUCT lpMeasureItemStruct);
	afx_msg void OnOperatorM();
	afx_msg void OnAboutbox();
	afx_msg void OnBookInfo();
	afx_msg void OnProviderInfo();
	afx_msg void OnBookType();
	afx_msg void OnCkInfo();
	afx_msg void OnDeskInfo();
	afx_msg void OnBookInput();
	afx_msg void OnBookPrice();
	afx_msg void OnBookPriceAdjust();
	afx_msg void OnInputBack();
	afx_msg void OnBookAdjust();
	afx_msg void OnSaleM();
	afx_msg void OnSaleBack();
	afx_msg void OnInputQuery();
	afx_msg void OnInputBackQuery();
	afx_msg void OnSaleQuery();
	afx_msg void OnSaleBackQuery();
	afx_msg void OnButton8();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_BBBDLG_H__196B6212_A7A5_4CCC_92EA_C9F39A7D892F__INCLUDED_)
