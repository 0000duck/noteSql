#if !defined(AFX_STARTUP_H__D4A7E759_AF38_4F50_B3FE_CE72AC596023__INCLUDED_)
#define AFX_STARTUP_H__D4A7E759_AF38_4F50_B3FE_CE72AC596023__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// StartUp.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CStartUp dialog

class CStartUp : public CDialog
{
// Construction
public:
	CStartUp(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CStartUp)
	enum { IDD = IDD_STARTUP };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStartUp)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CStartUp)
	virtual BOOL OnInitDialog();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STARTUP_H__D4A7E759_AF38_4F50_B3FE_CE72AC596023__INCLUDED_)
