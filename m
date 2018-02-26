From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
 (also NV44A)
Date: Mon, 26 Feb 2018 11:53:35 +0000
Message-ID: <bug-70388-8800-86pTdRZ87D@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0084678564=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0084678564==
Content-Type: multipart/alternative; boundary="15196460153.DC25.12875"
Content-Transfer-Encoding: 7bit


--15196460153.DC25.12875
Date: Mon, 26 Feb 2018 11:53:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70388

Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org

--- Comment #37 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Linas Vepstas from comment #33)
> After this, starting X a second time does not generate any video-out, so
> monitors stay blanked. Nothing at all printed in /var/log/syslog. However
> kern.log shows:
>=20
> Oct 31 15:41:47 fanny kernel: [ 2761.045902] INFO: task kworker/10:1:135
> blocked for more than 120 seconds.
> Oct 31 15:41:47 fanny kernel: [ 2761.045912]       Not tainted
> 3.18.0-rc2-linas #5
> Oct 31 15:41:47 fanny kernel: [ 2761.045915] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Oct 31 15:41:47 fanny kernel: [ 2761.045920] kworker/10:1    D
> ffff88085dd53040     0   135      2 0x00000000
> Oct 31 15:41:47 fanny kernel: [ 2761.045959] Workqueue: events
> output_poll_execute [drm_kms_helper]

This hung task issue has been fixed in v4.16-rc3 with
https://git.kernel.org/linus/d61a5c106351

It is unrelated however to the "failed to idle channel" issue AFAICS.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15196460153.DC25.12875
Date: Mon, 26 Feb 2018 11:53:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lukas&#64=
;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <span class=
=3D"fn">Lukas Wunner</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70388">bug 70388<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>lukas&#64;wunner.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70388#c37">Commen=
t # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70388">bug 70388<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Linas Vepstas from <a href=3D"show_bug.cgi?id=3D7=
0388#c33">comment #33</a>)
<span class=3D"quote">&gt; After this, starting X a second time does not ge=
nerate any video-out, so
&gt; monitors stay blanked. Nothing at all printed in /var/log/syslog. Howe=
ver
&gt; kern.log shows:
&gt;=20
&gt; Oct 31 15:41:47 fanny kernel: [ 2761.045902] INFO: task kworker/10:1:1=
35
&gt; blocked for more than 120 seconds.
&gt; Oct 31 15:41:47 fanny kernel: [ 2761.045912]       Not tainted
&gt; 3.18.0-rc2-linas #5
&gt; Oct 31 15:41:47 fanny kernel: [ 2761.045915] &quot;echo 0 &gt;
&gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
&gt; Oct 31 15:41:47 fanny kernel: [ 2761.045920] kworker/10:1    D
&gt; ffff88085dd53040     0   135      2 0x00000000
&gt; Oct 31 15:41:47 fanny kernel: [ 2761.045959] Workqueue: events
&gt; output_poll_execute [drm_kms_helper]</span >

This hung task issue has been fixed in v4.16-rc3 with
<a href=3D"https://git.kernel.org/linus/d61a5c106351">https://git.kernel.or=
g/linus/d61a5c106351</a>

It is unrelated however to the &quot;failed to idle channel&quot; issue AFA=
ICS.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15196460153.DC25.12875--

--===============0084678564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0084678564==--
