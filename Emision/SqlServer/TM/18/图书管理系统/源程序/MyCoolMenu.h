// MyCoolMenu.h: interface for the CMyCoolMenu class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MYCOOLMENU_H__061B4615_4569_4278_9F86_6DFF6FCEA45F__INCLUDED_)
#define AFX_MYCOOLMENU_H__061B4615_4569_4278_9F86_6DFF6FCEA45F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef Public_Area
#define Public_Area 20   //左边灰色区域宽度
#endif
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class CMenuItemContext   
{
public:	
	int     nMenuID; //-2:顶层菜单条 -1:弹出菜单 0:分隔条 >0:一般的菜单	
	CString strText;//菜单文本
};

class CMyCoolMenu : public CMenu  
{
public:
	CMyCoolMenu();
	virtual ~CMyCoolMenu();
	CMenuItemContext lpMenu[100];
	int index;

public:
	void show();
	//methodUINT uToolBarID,
	BOOL		ChangeMenuStyle(HMENU hMenu, BOOL bTop);
	BOOL		AttachMenu(HMENU hMenu,CSize sz);
	void		DrawBestRect(CDC *pDC, CRect rect, COLORREF cr1,COLORREF cr2, BOOL bHor);
	void		DrawTop(CDC *pDC,CRect rect,BOOL bSelected);
	void		DrawBGColor(CDC* pDC, CRect rect, BOOL bSelected);
	void		DrawText(CDC* pDC, CRect rect, CString sText);
	void		DrawGray(CDC* pDC, CRect rect, CString sText);
	virtual		void DrawItem(LPDRAWITEMSTRUCT lpDIS);
	virtual		void MeasureItem(LPMEASUREITEMSTRUCT lpMIS);
};

#endif // !defined(AFX_MYCOOLMENU_H__061B4615_4569_4278_9F86_6DFF6FCEA45F__INCLUDED_)
