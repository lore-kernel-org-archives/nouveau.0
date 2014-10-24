From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Fri, 24 Oct 2014 16:00:20 +0000
Message-ID: <bug-84706-8800-043iW0PZk5@http.bugs.freedesktop.org/>
References: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0850738818=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0850738818==
Content-Type: multipart/alternative; boundary="1414166420.E1cFDD2.2147"; charset="UTF-8"


--1414166420.E1cFDD2.2147
Date: Fri, 24 Oct 2014 16:00:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84706

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Just noticed this:

[    0.269025] vesafb: mode is 640x480x32, linelength=2560, pages=0
[    0.284092] fb0: VESA VGA frame buffer device

Please get rid of all that stuff from your kernel... it can't possibly be
helping. (And is, in all likelihood, hurting.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414166420.E1cFDD2.2147
Date: Fri, 24 Oct 2014 16:00:20 +0000
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
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706">bug 84706</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Just noticed this:

[    0.269025] vesafb: mode is 640x480x32, linelength=2560, pages=0
[    0.284092] fb0: VESA VGA frame buffer device

Please get rid of all that stuff from your kernel... it can't possibly be
helping. (And is, in all likelihood, hurting.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414166420.E1cFDD2.2147--

--===============0850738818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0850738818==--
