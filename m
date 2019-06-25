From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110993] GP107GLM [Quadro P1000 Mobile]: frequent
 failure to initialize displays on Thunderbolt dock
Date: Tue, 25 Jun 2019 12:26:26 +0000
Message-ID: <bug-110993-8800-95Cq1sLxnr@http.bugs.freedesktop.org/>
References: <bug-110993-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414407469=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110993-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0414407469==
Content-Type: multipart/alternative; boundary="15614655861.e88a.4843"
Content-Transfer-Encoding: 7bit


--15614655861.e88a.4843
Date: Tue, 25 Jun 2019 12:26:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110993

--- Comment #2 from Markus Wanner <markus-XHb0b+agOrdyDzI6CaY1VQ@public.gmane.org> ---
Created attachment 144634
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144634&action=3Dedit
test run 2 - annotated kern.log

For the second run, I re-enabled the runpm_fixes and tried to perform the e=
xact
same steps as during run 1 to check if that makes a difference.  Same start=
ing
conditions otherwise: dock already attached, but no monitors plugged into t=
he
dock or the laptop.

Jun 21 10:49:13 calaton kernel: [  199.796511]: login
Jun 21 10:49:47 calaton kernel: [  234.186963]: plug HDMI into laptop direc=
tly,
works
Jun 21 10:50:00 calaton kernel: [  246.472930]: pull HDMI cable from laptop
Jun 21 10:51:34 calaton kernel: [  341.384332]: plug HDMI cable into dock -=
 not
recognized, display lights up, but goes back into standby
Jun 21 10:52:20 calaton kernel: [  386.757948]: plug DP into dock - not
recognized, display lights up, but goes back into standby
Jun 21 10:52:57 calaton kernel: [  424.339095]: pull HDMI cable out of dock=
 -
no change, display lights up, but goes back into standby
Jun 21 10:53:36 calaton kernel: [  462.525517]: plug HDMI cable into laptop=
 -
recognized
Jun 21 10:53:51 calaton kernel: [  477.800605]: unplug the Dock - no change,
Levovo on HDMI and internal display remain active.
Jun 21 10:54:51 calaton kernel: [  537.523191]: re-plug the Dock - Dell not
recognized
Jun 21 10:55:16 calaton kernel: [  562.760425]: pull the HDMI cable
Jun 21 10:55:57 calaton kernel: [  604.330288]: plug HDMI cable into dock -
neither Dell nor Lenovo recognized
Jun 21 10:56:40 calaton kernel: [  647.138495]: pull the dock
Jun 21 10:56:55 calaton kernel: [  662.366295]: plug the Dock again
Jun 21 10:58:26 calaton kernel: [  752.986238]: pull the dock
Jun 21 10:58:41 calaton kernel: [  768.201244]: plug the Dock again
Jun 21 10:59:53 calaton kernel: [  840.353587]: pull the dock, pull the HDMI
from the dock
Jun 21 11:00:08 calaton kernel: [  855.417667]: plug the dock (with only th=
e DP
display attached)
Jun 21 11:01:48 calaton kernel: [  955.154927]: pull the dock
Jun 21 11:02:03 calaton kernel: [  970.227148]: re-plug the dock (with only=
 the
HDMI display attached)
Jun 21 11:03:14 calaton kernel: [ 1040.747229]: pull the dock, pull the HDMI
from the dock, re-attach DP to the dock
Jun 21 11:03:29 calaton kernel: [ 1055.830960]: attach HDMI to laptop -
recognized properly

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

Jun 21 11:05:00 calaton kernel: [ 1146.466630]: re-plug the dock (with HDMI
already attached, DP on dock)
Jun 21 11:06:28 calaton kernel: [ 1234.650085]: unplug the DP from the dock
Jun 21 11:07:00 calaton kernel: [ 1266.460845]: re-plug the DP to the dock
Jun 21 11:07:30 calaton kernel: [ 1297.127079]: unplug the dock from the la=
ptop

Again, the attached log is annotated with actions and observations.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614655861.e88a.4843
Date: Tue, 25 Jun 2019 12:26:26 +0000
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
   title=3D"NEW - GP107GLM [Quadro P1000 Mobile]: frequent failure to initi=
alize displays on Thunderbolt dock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110993#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GP107GLM [Quadro P1000 Mobile]: frequent failure to initi=
alize displays on Thunderbolt dock"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110993">bug 11099=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
markus&#64;bluegap.ch" title=3D"Markus Wanner &lt;markus&#64;bluegap.ch&gt;=
"> <span class=3D"fn">Markus Wanner</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144634=
" name=3D"attach_144634" title=3D"test run 2 - annotated kern.log">attachme=
nt 144634</a> <a href=3D"attachment.cgi?id=3D144634&amp;action=3Dedit" titl=
e=3D"test run 2 - annotated kern.log">[details]</a></span>
test run 2 - annotated kern.log

For the second run, I re-enabled the runpm_fixes and tried to perform the e=
xact
same steps as during run 1 to check if that makes a difference.  Same start=
ing
conditions otherwise: dock already attached, but no monitors plugged into t=
he
dock or the laptop.

Jun 21 10:49:13 calaton kernel: [  199.796511]: login
Jun 21 10:49:47 calaton kernel: [  234.186963]: plug HDMI into laptop direc=
tly,
works
Jun 21 10:50:00 calaton kernel: [  246.472930]: pull HDMI cable from laptop
Jun 21 10:51:34 calaton kernel: [  341.384332]: plug HDMI cable into dock -=
 not
recognized, display lights up, but goes back into standby
Jun 21 10:52:20 calaton kernel: [  386.757948]: plug DP into dock - not
recognized, display lights up, but goes back into standby
Jun 21 10:52:57 calaton kernel: [  424.339095]: pull HDMI cable out of dock=
 -
no change, display lights up, but goes back into standby
Jun 21 10:53:36 calaton kernel: [  462.525517]: plug HDMI cable into laptop=
 -
recognized
Jun 21 10:53:51 calaton kernel: [  477.800605]: unplug the Dock - no change,
Levovo on HDMI and internal display remain active.
Jun 21 10:54:51 calaton kernel: [  537.523191]: re-plug the Dock - Dell not
recognized
Jun 21 10:55:16 calaton kernel: [  562.760425]: pull the HDMI cable
Jun 21 10:55:57 calaton kernel: [  604.330288]: plug HDMI cable into dock -
neither Dell nor Lenovo recognized
Jun 21 10:56:40 calaton kernel: [  647.138495]: pull the dock
Jun 21 10:56:55 calaton kernel: [  662.366295]: plug the Dock again
Jun 21 10:58:26 calaton kernel: [  752.986238]: pull the dock
Jun 21 10:58:41 calaton kernel: [  768.201244]: plug the Dock again
Jun 21 10:59:53 calaton kernel: [  840.353587]: pull the dock, pull the HDMI
from the dock
Jun 21 11:00:08 calaton kernel: [  855.417667]: plug the dock (with only th=
e DP
display attached)
Jun 21 11:01:48 calaton kernel: [  955.154927]: pull the dock
Jun 21 11:02:03 calaton kernel: [  970.227148]: re-plug the dock (with only=
 the
HDMI display attached)
Jun 21 11:03:14 calaton kernel: [ 1040.747229]: pull the dock, pull the HDMI
from the dock, re-attach DP to the dock
Jun 21 11:03:29 calaton kernel: [ 1055.830960]: attach HDMI to laptop -
recognized properly

/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card1-DP-1/status:disconnected
/sys/class/drm/card1-DP-2/status:disconnected
/sys/class/drm/card1-HDMI-A-1/status:connected
/sys/class/drm/card1-eDP-2/status:disconnected

Jun 21 11:05:00 calaton kernel: [ 1146.466630]: re-plug the dock (with HDMI
already attached, DP on dock)
Jun 21 11:06:28 calaton kernel: [ 1234.650085]: unplug the DP from the dock
Jun 21 11:07:00 calaton kernel: [ 1266.460845]: re-plug the DP to the dock
Jun 21 11:07:30 calaton kernel: [ 1297.127079]: unplug the dock from the la=
ptop

Again, the attached log is annotated with actions and observations.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614655861.e88a.4843--

--===============0414407469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0414407469==--
