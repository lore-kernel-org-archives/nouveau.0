From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102722] [regression] changing resolution hangs the
 display on Lenovo Thinkpad p51
Date: Thu, 14 Sep 2017 06:51:06 +0000
Message-ID: <bug-102722-8800-cSqKd7yUUC@http.bugs.freedesktop.org/>
References: <bug-102722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0098358845=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102722-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0098358845==
Content-Type: multipart/alternative; boundary="15053718660.C37D09DD.31408";
 charset="UTF-8"


--15053718660.C37D09DD.31408
Date: Thu, 14 Sep 2017 06:51:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102722

--- Comment #6 from craig harmer <charmer-freedesktop.org-kYREfu93XNOEi8DpZVb4nw@public.gmane.org> ---
Created attachment 134218
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134218&action=3Dedit
Kubuntu 16.04.3 contents of /etc/X11

compressed tarball of /etc/X11, consisting of the following files:

craigster0@wideload[xorg-config-16.04.3] tar -tf etc-X11.tgz=20
etc/X11/
etc/X11/xkb/
etc/X11/Xresources/
etc/X11/Xresources/x11-common
etc/X11/xinit/
etc/X11/xinit/xserverrc
etc/X11/xinit/xinitrc
etc/X11/xinit/xinputrc
etc/X11/xinit/xinitrc.d/
etc/X11/Xreset
etc/X11/xsm/
etc/X11/xsm/system.xsm
etc/X11/fonts/
etc/X11/fonts/Type1/
etc/X11/fonts/Type1/xfonts-scalable.scale
etc/X11/fonts/misc/
etc/X11/fonts/misc/xfonts-base.alias
etc/X11/Xsession.options
etc/X11/Xwrapper.config
etc/X11/rgb.txt
etc/X11/Xsession
etc/X11/cursors/
etc/X11/cursors/Breeze_Snow.theme
etc/X11/cursors/breeze_cursors.theme
etc/X11/Xreset.d/
etc/X11/Xreset.d/README
etc/X11/app-defaults/
etc/X11/app-defaults/XLogo-color
etc/X11/app-defaults/Bitmap-nocase
etc/X11/app-defaults/Xditview
etc/X11/app-defaults/XMore
etc/X11/app-defaults/XCalc
etc/X11/app-defaults/XSm
etc/X11/app-defaults/Xvidtune
etc/X11/app-defaults/XClock-color
etc/X11/app-defaults/Xfd
etc/X11/app-defaults/XLogo
etc/X11/app-defaults/Xmag
etc/X11/app-defaults/XLoad
etc/X11/app-defaults/Xedit-color
etc/X11/app-defaults/Bitmap-color
etc/X11/app-defaults/Viewres-color
etc/X11/app-defaults/XClock
etc/X11/app-defaults/Clock-color
etc/X11/app-defaults/Xgc-color
etc/X11/app-defaults/Xedit
etc/X11/app-defaults/Xgc
etc/X11/app-defaults/Editres-color
etc/X11/app-defaults/XClipboard
etc/X11/app-defaults/Editres
etc/X11/app-defaults/XFontSel
etc/X11/app-defaults/Xmessage
etc/X11/app-defaults/Bitmap
etc/X11/app-defaults/Viewres
etc/X11/app-defaults/Xditview-chrtr
etc/X11/app-defaults/Xmessage-color
etc/X11/app-defaults/XConsole
etc/X11/app-defaults/Xman
etc/X11/app-defaults/XCalc-color
etc/X11/Xsession.d/
etc/X11/Xsession.d/70im-config_launch
etc/X11/Xsession.d/65snappy
etc/X11/Xsession.d/35x11-common_xhost-local
etc/X11/Xsession.d/50x11-common_determine-startup
etc/X11/Xsession.d/60xdg-user-dirs-update
etc/X11/Xsession.d/40x11-common_xsessionrc
etc/X11/Xsession.d/75dbus_dbus-launch
etc/X11/Xsession.d/60x11-common_localhost
etc/X11/Xsession.d/70gconfd_path-on-session
etc/X11/Xsession.d/99x11-common_start
etc/X11/Xsession.d/95dbus_update-activation-env
etc/X11/Xsession.d/60x11-common_xdg_path
etc/X11/Xsession.d/30x11-common_xresources
etc/X11/Xsession.d/20x11-common_process-args
etc/X11/Xsession.d/70xdg-kubuntu-dir
etc/X11/Xsession.d/80kubuntu-xmodmap
etc/X11/Xsession.d/90x11-common_ssh-agent
etc/X11/Xsession.d/90qt-a11y
etc/X11/Xsession.d/90gpg-agent
etc/X11/default-display-manager
craigster0@wideload[xorg-config-16.04.3] tar -tf etc-X11.tgz=20
etc/X11/
etc/X11/xkb/
etc/X11/Xresources/
etc/X11/Xresources/x11-common
etc/X11/xinit/
etc/X11/xinit/xserverrc
etc/X11/xinit/xinitrc
etc/X11/xinit/xinputrc
etc/X11/xinit/xinitrc.d/
etc/X11/Xreset
etc/X11/xsm/
etc/X11/xsm/system.xsm
etc/X11/fonts/
etc/X11/fonts/Type1/
etc/X11/fonts/Type1/xfonts-scalable.scale
etc/X11/fonts/misc/
etc/X11/fonts/misc/xfonts-base.alias
etc/X11/Xsession.options
etc/X11/Xwrapper.config
etc/X11/rgb.txt
etc/X11/Xsession
etc/X11/cursors/
etc/X11/cursors/Breeze_Snow.theme
etc/X11/cursors/breeze_cursors.theme
etc/X11/Xreset.d/
etc/X11/Xreset.d/README
etc/X11/app-defaults/
etc/X11/app-defaults/XLogo-color
etc/X11/app-defaults/Bitmap-nocase
etc/X11/app-defaults/Xditview
etc/X11/app-defaults/XMore
etc/X11/app-defaults/XCalc
etc/X11/app-defaults/XSm
etc/X11/app-defaults/Xvidtune
etc/X11/app-defaults/XClock-color
etc/X11/app-defaults/Xfd
etc/X11/app-defaults/XLogo
etc/X11/app-defaults/Xmag
etc/X11/app-defaults/XLoad
etc/X11/app-defaults/Xedit-color
etc/X11/app-defaults/Bitmap-color
etc/X11/app-defaults/Viewres-color
etc/X11/app-defaults/XClock
etc/X11/app-defaults/Clock-color
etc/X11/app-defaults/Xgc-color
etc/X11/app-defaults/Xedit
etc/X11/app-defaults/Xgc
etc/X11/app-defaults/Editres-color
etc/X11/app-defaults/XClipboard
etc/X11/app-defaults/Editres
etc/X11/app-defaults/XFontSel
etc/X11/app-defaults/Xmessage
etc/X11/app-defaults/Bitmap
etc/X11/app-defaults/Viewres
etc/X11/app-defaults/Xditview-chrtr
etc/X11/app-defaults/Xmessage-color
etc/X11/app-defaults/XConsole
etc/X11/app-defaults/Xman
etc/X11/app-defaults/XCalc-color
etc/X11/Xsession.d/
etc/X11/Xsession.d/70im-config_launch
etc/X11/Xsession.d/65snappy
etc/X11/Xsession.d/35x11-common_xhost-local
etc/X11/Xsession.d/50x11-common_determine-startup
etc/X11/Xsession.d/60xdg-user-dirs-update
etc/X11/Xsession.d/40x11-common_xsessionrc
etc/X11/Xsession.d/75dbus_dbus-launch
etc/X11/Xsession.d/60x11-common_localhost
etc/X11/Xsession.d/70gconfd_path-on-session
etc/X11/Xsession.d/99x11-common_start
etc/X11/Xsession.d/95dbus_update-activation-env
etc/X11/Xsession.d/60x11-common_xdg_path
etc/X11/Xsession.d/30x11-common_xresources
etc/X11/Xsession.d/20x11-common_process-args
etc/X11/Xsession.d/70xdg-kubuntu-dir
etc/X11/Xsession.d/80kubuntu-xmodmap
etc/X11/Xsession.d/90x11-common_ssh-agent
etc/X11/Xsession.d/90qt-a11y
etc/X11/Xsession.d/90gpg-agent
etc/X11/default-display-manager

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15053718660.C37D09DD.31408
Date: Thu, 14 Sep 2017 06:51:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] changing resolution hangs the display on Len=
ovo Thinkpad p51"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102722#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] changing resolution hangs the display on Len=
ovo Thinkpad p51"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102722">bug 10272=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
charmer-freedesktop.org&#64;punchdown.org" title=3D"craig harmer &lt;charme=
r-freedesktop.org&#64;punchdown.org&gt;"> <span class=3D"fn">craig harmer</=
span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134218=
" name=3D"attach_134218" title=3D"Kubuntu 16.04.3 contents of /etc/X11">att=
achment 134218</a> <a href=3D"attachment.cgi?id=3D134218&amp;action=3Dedit"=
 title=3D"Kubuntu 16.04.3 contents of /etc/X11">[details]</a></span>
Kubuntu 16.04.3 contents of /etc/X11

compressed tarball of /etc/X11, consisting of the following files:

craigster0&#64;wideload[xorg-config-16.04.3] tar -tf etc-X11.tgz=20
etc/X11/
etc/X11/xkb/
etc/X11/Xresources/
etc/X11/Xresources/x11-common
etc/X11/xinit/
etc/X11/xinit/xserverrc
etc/X11/xinit/xinitrc
etc/X11/xinit/xinputrc
etc/X11/xinit/xinitrc.d/
etc/X11/Xreset
etc/X11/xsm/
etc/X11/xsm/system.xsm
etc/X11/fonts/
etc/X11/fonts/Type1/
etc/X11/fonts/Type1/xfonts-scalable.scale
etc/X11/fonts/misc/
etc/X11/fonts/misc/xfonts-base.alias
etc/X11/Xsession.options
etc/X11/Xwrapper.config
etc/X11/rgb.txt
etc/X11/Xsession
etc/X11/cursors/
etc/X11/cursors/Breeze_Snow.theme
etc/X11/cursors/breeze_cursors.theme
etc/X11/Xreset.d/
etc/X11/Xreset.d/README
etc/X11/app-defaults/
etc/X11/app-defaults/XLogo-color
etc/X11/app-defaults/Bitmap-nocase
etc/X11/app-defaults/Xditview
etc/X11/app-defaults/XMore
etc/X11/app-defaults/XCalc
etc/X11/app-defaults/XSm
etc/X11/app-defaults/Xvidtune
etc/X11/app-defaults/XClock-color
etc/X11/app-defaults/Xfd
etc/X11/app-defaults/XLogo
etc/X11/app-defaults/Xmag
etc/X11/app-defaults/XLoad
etc/X11/app-defaults/Xedit-color
etc/X11/app-defaults/Bitmap-color
etc/X11/app-defaults/Viewres-color
etc/X11/app-defaults/XClock
etc/X11/app-defaults/Clock-color
etc/X11/app-defaults/Xgc-color
etc/X11/app-defaults/Xedit
etc/X11/app-defaults/Xgc
etc/X11/app-defaults/Editres-color
etc/X11/app-defaults/XClipboard
etc/X11/app-defaults/Editres
etc/X11/app-defaults/XFontSel
etc/X11/app-defaults/Xmessage
etc/X11/app-defaults/Bitmap
etc/X11/app-defaults/Viewres
etc/X11/app-defaults/Xditview-chrtr
etc/X11/app-defaults/Xmessage-color
etc/X11/app-defaults/XConsole
etc/X11/app-defaults/Xman
etc/X11/app-defaults/XCalc-color
etc/X11/Xsession.d/
etc/X11/Xsession.d/70im-config_launch
etc/X11/Xsession.d/65snappy
etc/X11/Xsession.d/35x11-common_xhost-local
etc/X11/Xsession.d/50x11-common_determine-startup
etc/X11/Xsession.d/60xdg-user-dirs-update
etc/X11/Xsession.d/40x11-common_xsessionrc
etc/X11/Xsession.d/75dbus_dbus-launch
etc/X11/Xsession.d/60x11-common_localhost
etc/X11/Xsession.d/70gconfd_path-on-session
etc/X11/Xsession.d/99x11-common_start
etc/X11/Xsession.d/95dbus_update-activation-env
etc/X11/Xsession.d/60x11-common_xdg_path
etc/X11/Xsession.d/30x11-common_xresources
etc/X11/Xsession.d/20x11-common_process-args
etc/X11/Xsession.d/70xdg-kubuntu-dir
etc/X11/Xsession.d/80kubuntu-xmodmap
etc/X11/Xsession.d/90x11-common_ssh-agent
etc/X11/Xsession.d/90qt-a11y
etc/X11/Xsession.d/90gpg-agent
etc/X11/default-display-manager
craigster0&#64;wideload[xorg-config-16.04.3] tar -tf etc-X11.tgz=20
etc/X11/
etc/X11/xkb/
etc/X11/Xresources/
etc/X11/Xresources/x11-common
etc/X11/xinit/
etc/X11/xinit/xserverrc
etc/X11/xinit/xinitrc
etc/X11/xinit/xinputrc
etc/X11/xinit/xinitrc.d/
etc/X11/Xreset
etc/X11/xsm/
etc/X11/xsm/system.xsm
etc/X11/fonts/
etc/X11/fonts/Type1/
etc/X11/fonts/Type1/xfonts-scalable.scale
etc/X11/fonts/misc/
etc/X11/fonts/misc/xfonts-base.alias
etc/X11/Xsession.options
etc/X11/Xwrapper.config
etc/X11/rgb.txt
etc/X11/Xsession
etc/X11/cursors/
etc/X11/cursors/Breeze_Snow.theme
etc/X11/cursors/breeze_cursors.theme
etc/X11/Xreset.d/
etc/X11/Xreset.d/README
etc/X11/app-defaults/
etc/X11/app-defaults/XLogo-color
etc/X11/app-defaults/Bitmap-nocase
etc/X11/app-defaults/Xditview
etc/X11/app-defaults/XMore
etc/X11/app-defaults/XCalc
etc/X11/app-defaults/XSm
etc/X11/app-defaults/Xvidtune
etc/X11/app-defaults/XClock-color
etc/X11/app-defaults/Xfd
etc/X11/app-defaults/XLogo
etc/X11/app-defaults/Xmag
etc/X11/app-defaults/XLoad
etc/X11/app-defaults/Xedit-color
etc/X11/app-defaults/Bitmap-color
etc/X11/app-defaults/Viewres-color
etc/X11/app-defaults/XClock
etc/X11/app-defaults/Clock-color
etc/X11/app-defaults/Xgc-color
etc/X11/app-defaults/Xedit
etc/X11/app-defaults/Xgc
etc/X11/app-defaults/Editres-color
etc/X11/app-defaults/XClipboard
etc/X11/app-defaults/Editres
etc/X11/app-defaults/XFontSel
etc/X11/app-defaults/Xmessage
etc/X11/app-defaults/Bitmap
etc/X11/app-defaults/Viewres
etc/X11/app-defaults/Xditview-chrtr
etc/X11/app-defaults/Xmessage-color
etc/X11/app-defaults/XConsole
etc/X11/app-defaults/Xman
etc/X11/app-defaults/XCalc-color
etc/X11/Xsession.d/
etc/X11/Xsession.d/70im-config_launch
etc/X11/Xsession.d/65snappy
etc/X11/Xsession.d/35x11-common_xhost-local
etc/X11/Xsession.d/50x11-common_determine-startup
etc/X11/Xsession.d/60xdg-user-dirs-update
etc/X11/Xsession.d/40x11-common_xsessionrc
etc/X11/Xsession.d/75dbus_dbus-launch
etc/X11/Xsession.d/60x11-common_localhost
etc/X11/Xsession.d/70gconfd_path-on-session
etc/X11/Xsession.d/99x11-common_start
etc/X11/Xsession.d/95dbus_update-activation-env
etc/X11/Xsession.d/60x11-common_xdg_path
etc/X11/Xsession.d/30x11-common_xresources
etc/X11/Xsession.d/20x11-common_process-args
etc/X11/Xsession.d/70xdg-kubuntu-dir
etc/X11/Xsession.d/80kubuntu-xmodmap
etc/X11/Xsession.d/90x11-common_ssh-agent
etc/X11/Xsession.d/90qt-a11y
etc/X11/Xsession.d/90gpg-agent
etc/X11/default-display-manager</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15053718660.C37D09DD.31408--

--===============0098358845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0098358845==--
