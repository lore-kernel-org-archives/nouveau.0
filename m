From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] DVI monitor connected via HDMI is
 blank / standby (NV96 / 9500GS)
Date: Sat, 24 Aug 2013 23:55:01 +0000
Message-ID: <bug-43939-8800-LCto4iTpKI@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0910720443=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0910720443==
Content-Type: multipart/alternative; boundary="1377388501.Bd5D67C53.15613"; charset="us-ascii"


--1377388501.Bd5D67C53.15613
Date: Sat, 24 Aug 2013 23:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Would you mind trying 3.11-rc6, or apply
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9a7046d55f319b2dde5d2536cc2adb01ebdbe09e
to your kernel? I'm not 100% sure it'll fix things, but it's definitely worth a
shot. I can't quite tell if your DCB types would have gotten messed up by this
test or not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377388501.Bd5D67C53.15613
Date: Sat, 24 Aug 2013 23:55:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Would you mind trying 3.11-rc6, or apply
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9a7046d55f319b2dde5d2536cc2adb01ebdbe09e">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9a7046d55f319b2dde5d2536cc2adb01ebdbe09e</a>
to your kernel? I'm not 100% sure it'll fix things, but it's definitely worth a
shot. I can't quite tell if your DCB types would have gotten messed up by this
test or not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377388501.Bd5D67C53.15613--

--===============0910720443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0910720443==--
