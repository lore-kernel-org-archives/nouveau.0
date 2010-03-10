From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26992] New: Systemsettings crashes when I try to
 open desktop settings
Date: Wed, 10 Mar 2010 01:53:30 -0800 (PST)
Message-ID: <bug-26992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=26992

           Summary: Systemsettings crashes when I try to open desktop
                    settings
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex.vizor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Application that crashed: systemsettings
Version of the application: 1.0
KDE Version: 4.3.4 (KDE 4.3.4)
Qt Version: 4.6.2
Operating System: Linux 2.6.34-rc1 x86_64
Distribution: Debian GNU/Linux unstable (sid)

What I was doing when the application crashed:
It crashs when I tried to enter into desctop settings and switch effects from
openGL to Xrander. I don't use gallium and that is strange for me why it is in
trace.

 -- Backtrace:
Application: System Settings (systemsettings), signal: Segmentation fault
[KCrash Handler]
#5  0x00007fc5c722beec in OUT_RING (ws=<value optimized out>, dev=<value
optimized out>) at /usr/include/nouveau/nouveau_pushbuf.h:70
#6  BEGIN_RING (ws=<value optimized out>, dev=<value optimized out>) at
/usr/include/nouveau/nouveau_pushbuf.h:110
#7  so_emit (ws=<value optimized out>, dev=<value optimized out>) at
../../../../src/gallium/drivers/nouveau/nouveau_stateobj.h:256
#8  nv50_screen_create (ws=<value optimized out>, dev=<value optimized out>) at
nv50_screen.c:312
#9  0x00007fc5c71e2ef6 in nouveau_drm_create_screen (api=0x7fc5c7634f20,
fd=<value optimized out>, arg=0x7fff40065e80) at nouveau_drm_api.c:108
#10 0x00007fc5c71e1188 in dri_init_screen2 (sPriv=0x117b1f0) at
dri_screen.c:304
#11 0x00007fc5c71de3e9 in dri2CreateNewScreen (scrn=<value optimized out>,
fd=<value optimized out>, extensions=<value optimized out>,
driver_configs=0x7fff40065f60, data=<value optimized out>)
    at ../../../../../../src/mesa/drivers/dri/common/dri_util.c:802
#12 0x00007fc5c7ede62f in ?? () from /usr/lib/libGL.so.1
#13 0x00007fc5c7ebb61f in ?? () from /usr/lib/libGL.so.1
#14 0x00007fc5c7eb6959 in glXQueryVersion () from /usr/lib/libGL.so.1
#15 0x00007fc5c8131cec in ?? () from /usr/lib/kde4/kcm_kwincompositing.so
#16 0x00007fc5c81264a0 in ?? () from /usr/lib/kde4/kcm_kwincompositing.so
#17 0x00007fc5c812d795 in QObject*
KPluginFactory::createInstance<KWin::KWinCompositingConfig, QWidget>(QWidget*,
QObject*, QList<QVariant> const&) () from /usr/lib/kde4/kcm_kwincompositing.so
#18 0x00007fc5e176d8ce in KPluginFactory::create(char const*, QWidget*,
QObject*, QList<QVariant> const&, QString const&) () from
/usr/lib/libkdecore.so.5
#19 0x00007fc5e2f34e66 in KCModuleLoader::loadModule(KCModuleInfo const&,
KCModuleLoader::ErrorReporting, QWidget*, QStringList const&) () from
/usr/lib/libkutils.so.4
#20 0x00007fc5e2f3a597 in ?? () from /usr/lib/libkutils.so.4
#21 0x00007fc5e2f3b605 in KCModuleProxy::realModule() const () from
/usr/lib/libkutils.so.4
#22 0x00007fc5e2f3b8f2 in KCModuleProxy::showEvent(QShowEvent*) () from
/usr/lib/libkutils.so.4
#23 0x00007fc5e1c4a80d in QWidget::event(QEvent*) () from
/usr/lib/libQtGui.so.4
#24 0x00007fc5e1bf48fc in QApplicationPrivate::notify_helper(QObject*, QEvent*)
() from /usr/lib/libQtGui.so.4
#25 0x00007fc5e1bfaddb in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/libQtGui.so.4
#26 0x00007fc5e28fade6 in KApplication::notify(QObject*, QEvent*) () from
/usr/lib/libkdeui.so.5
#27 0x00007fc5e0fddddc in QCoreApplication::notifyInternal(QObject*, QEvent*)
() from /usr/lib/libQtCore.so.4
#28 0x00007fc5e1c4fcda in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#29 0x00007fc5e1c4ffb1 in QWidgetPrivate::showChildren(bool) () from
/usr/lib/libQtGui.so.4
#30 0x00007fc5e1c4fbcf in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#31 0x00007fc5e1c51e5a in QWidget::setVisible(bool) () from
/usr/lib/libQtGui.so.4
#32 0x00007fc5e1c50046 in QWidgetPrivate::showChildren(bool) () from
/usr/lib/libQtGui.so.4
#33 0x00007fc5e1c4fbcf in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#34 0x00007fc5e1c4ffb1 in QWidgetPrivate::showChildren(bool) () from
/usr/lib/libQtGui.so.4
#35 0x00007fc5e1c4fbcf in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#36 0x00007fc5e1c4ffb1 in QWidgetPrivate::showChildren(bool) () from
/usr/lib/libQtGui.so.4
#37 0x00007fc5e1c4fbcf in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#38 0x00007fc5e1c4ffb1 in QWidgetPrivate::showChildren(bool) () from
/usr/lib/libQtGui.so.4
#39 0x00007fc5e1c4fbcf in QWidgetPrivate::show_helper() () from
/usr/lib/libQtGui.so.4
#40 0x00007fc5e1c51e5a in QWidget::setVisible(bool) () from
/usr/lib/libQtGui.so.4
#41 0x00007fc5e1c3443d in QStackedLayout::setCurrentIndex(int) () from
/usr/lib/libQtGui.so.4
#42 0x00007fc5d10b9c09 in ?? () from /usr/lib/kde4/icon_mode.so
#43 0x00007fc5d10ba334 in ?? () from /usr/lib/kde4/icon_mode.so
#44 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#45 0x00007fc5e2d04e4f in ModuleView::moduleChanged(bool) () from
/usr/lib/libsystemsettingsview.so
#46 0x00007fc5e2d071f4 in ModuleView::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libsystemsettingsview.so
#47 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#48 0x00007fc5e292af08 in KPageWidget::currentPageChanged(KPageWidgetItem*,
KPageWidgetItem*) () from /usr/lib/libkdeui.so.5
#49 0x00007fc5e292b0a8 in KPageWidget::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libkdeui.so.5
#50 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#51 0x00007fc5e2926b17 in KPageView::currentPageChanged(QModelIndex const&,
QModelIndex const&) () from /usr/lib/libkdeui.so.5
#52 0x00007fc5e2927685 in ?? () from /usr/lib/libkdeui.so.5
#53 0x00007fc5e2928082 in KPageView::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libkdeui.so.5
#54 0x00007fc5e292b060 in KPageWidget::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libkdeui.so.5
#55 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#56 0x00007fc5e216c01a in QItemSelectionModel::currentChanged(QModelIndex
const&, QModelIndex const&) () from /usr/lib/libQtGui.so.4
#57 0x00007fc5e216c162 in QItemSelectionModel::setCurrentIndex(QModelIndex
const&, QFlags<QItemSelectionModel::SelectionFlag>) () from
/usr/lib/libQtGui.so.4
#58 0x00007fc5e29279c0 in ?? () from /usr/lib/libkdeui.so.5
#59 0x00007fc5e2927f75 in ?? () from /usr/lib/libkdeui.so.5
#60 0x00007fc5e2928092 in KPageView::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libkdeui.so.5
#61 0x00007fc5e292b060 in KPageWidget::qt_metacall(QMetaObject::Call, int,
void**) () from /usr/lib/libkdeui.so.5
#62 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#63 0x00007fc5e2d069ec in ModuleView::addModule(KCModuleInfo*) () from
/usr/lib/libsystemsettingsview.so
#64 0x00007fc5e2d06ee2 in ModuleView::loadModule(MenuItem*) () from
/usr/lib/libsystemsettingsview.so
#65 0x00007fc5d10b9d58 in ?? () from /usr/lib/kde4/icon_mode.so
#66 0x00007fc5d10ba351 in ?? () from /usr/lib/kde4/icon_mode.so
#67 0x00007fc5e0ff0b1f in QMetaObject::activate(QObject*, QMetaObject const*,
int, void**) () from /usr/lib/libQtCore.so.4
#68 0x00007fc5e2110065 in QAbstractItemView::activated(QModelIndex const&) ()
from /usr/lib/libQtGui.so.4
#69 0x00007fc5e211d16d in QAbstractItemView::mouseReleaseEvent(QMouseEvent*) ()
from /usr/lib/libQtGui.so.4
#70 0x00007fc5e213315e in QListView::mouseReleaseEvent(QMouseEvent*) () from
/usr/lib/libQtGui.so.4
#71 0x00007fc5e28e77c8 in KCategorizedView::mouseReleaseEvent(QMouseEvent*) ()
from /usr/lib/libkdeui.so.5
#72 0x00007fc5e1c4abe2 in QWidget::event(QEvent*) () from
/usr/lib/libQtGui.so.4
#73 0x00007fc5e1ff0816 in QFrame::event(QEvent*) () from /usr/lib/libQtGui.so.4
#74 0x00007fc5e211fa5b in QAbstractItemView::viewportEvent(QEvent*) () from
/usr/lib/libQtGui.so.4
#75 0x00007fc5e0fdd1f7 in
QCoreApplicationPrivate::sendThroughObjectEventFilters(QObject*, QEvent*) ()
from /usr/lib/libQtCore.so.4
#76 0x00007fc5e1bf48cc in QApplicationPrivate::notify_helper(QObject*, QEvent*)
() from /usr/lib/libQtGui.so.4
#77 0x00007fc5e1bfb5bb in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/libQtGui.so.4
#78 0x00007fc5e28fade6 in KApplication::notify(QObject*, QEvent*) () from
/usr/lib/libkdeui.so.5
#79 0x00007fc5e0fddddc in QCoreApplication::notifyInternal(QObject*, QEvent*)
() from /usr/lib/libQtCore.so.4
#80 0x00007fc5e1bfa78e in QApplicationPrivate::sendMouseEvent(QWidget*,
QMouseEvent*, QWidget*, QWidget*, QWidget**, QPointer<QWidget>&, bool) () from
/usr/lib/libQtGui.so.4
#81 0x00007fc5e1c7a33b in ?? () from /usr/lib/libQtGui.so.4
#82 0x00007fc5e1c7904a in QApplication::x11ProcessEvent(_XEvent*) () from
/usr/lib/libQtGui.so.4
#83 0x00007fc5e1ca4732 in ?? () from /usr/lib/libQtGui.so.4
#84 0x00007fc5dde175d0 in g_main_context_dispatch () from /lib/libglib-2.0.so.0
#85 0x00007fc5dde1b3f8 in ?? () from /lib/libglib-2.0.so.0
#86 0x00007fc5dde1b5dc in g_main_context_iteration () from
/lib/libglib-2.0.so.0
#87 0x00007fc5e1007233 in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) ()
from /usr/lib/libQtCore.so.4
#88 0x00007fc5e1ca432e in ?? () from /usr/lib/libQtGui.so.4
#89 0x00007fc5e0fdc702 in
QEventLoop::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/libQtCore.so.4
#90 0x00007fc5e0fdcadc in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/libQtCore.so.4
#91 0x00007fc5e0fe081b in QCoreApplication::exec() () from
/usr/lib/libQtCore.so.4
#92 0x000000000040cbc9 in _start ()


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
