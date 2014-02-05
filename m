From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Wed, 05 Feb 2014 21:26:51 +0000
Message-ID: <bug-70972-8800-nglSYcZEry@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1923585303=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1923585303==
Content-Type: multipart/alternative; boundary="1391635611.65d14A332.18982"; charset="us-ascii"


--1391635611.65d14A332.18982
Date: Wed, 5 Feb 2014 21:26:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, unrelated to this issue, you probably need

http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html

For MSI to work properly. We've had reports of issues for people on NV4E, and
it's also been confirmed that the registers are in a different place for NV63.
It's very likely to also be different on NV67. You can also disable MSI by
using nouveau.config=NvMSI=0 . (However if you can confirm that this patch
either helps or breaks things, that would be nice -- not a lot of people with
this HW.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391635611.65d14A332.18982
Date: Wed, 5 Feb 2014 21:26:51 +0000
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
   title="NEW --- - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Modesetting failure at 1280x800"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, unrelated to this issue, you probably need

<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016032.html</a>

For MSI to work properly. We've had reports of issues for people on NV4E, and
it's also been confirmed that the registers are in a different place for NV63.
It's very likely to also be different on NV67. You can also disable MSI by
using nouveau.config=NvMSI=0 . (However if you can confirm that this patch
either helps or breaks things, that would be nice -- not a lot of people with
this HW.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391635611.65d14A332.18982--

--===============1923585303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1923585303==--
