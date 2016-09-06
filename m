From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Tue, 06 Sep 2016 15:25:00 +0000
Message-ID: <bug-95282-8800-N4NRZCRCIy@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0593363614=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0593363614==
Content-Type: multipart/alternative; boundary="14731755000.A5eEfDd.20244";
 charset="UTF-8"


--14731755000.A5eEfDd.20244
Date: Tue, 6 Sep 2016 15:25:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95282

--- Comment #17 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Created attachment 126248
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D126248&action=3Dedit
dmesg while trying to play with vdpau by xine

 There is not much in the logs except:
nouveau 0000:01:00.0: bsp: Watchdog interrupt, engine hung.

 tested with kernel 9ca581b50dab6103183396852cc08e440fcda18e and a freshly
downloaded firmware.

  What may I do in order to get more meaningful debug information? Is vdpau
playback an issue that is being worked upon?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14731755000.A5eEfDd.20244
Date: Tue, 6 Sep 2016 15:25:00 +0000
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
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282#c17">Commen=
t # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D126248=
" name=3D"attach_126248" title=3D"dmesg while trying to play with vdpau by =
xine">attachment 126248</a> <a href=3D"attachment.cgi?id=3D126248&amp;actio=
n=3Dedit" title=3D"dmesg while trying to play with vdpau by xine">[details]=
</a></span>
dmesg while trying to play with vdpau by xine

 There is not much in the logs except:
nouveau 0000:01:00.0: bsp: Watchdog interrupt, engine hung.

 tested with kernel 9ca581b50dab6103183396852cc08e440fcda18e and a freshly
downloaded firmware.

  What may I do in order to get more meaningful debug information? Is vdpau
playback an issue that is being worked upon?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14731755000.A5eEfDd.20244--

--===============0593363614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0593363614==--
