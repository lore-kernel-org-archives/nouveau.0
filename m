From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] [NVE6] MMIO FAULT, black screen on QHD+ K2100M
Date: Mon, 26 May 2014 12:36:21 +0000
Message-ID: <bug-76319-8800-cd9YAVKcWq@http.bugs.freedesktop.org/>
References: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641501714=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1641501714==
Content-Type: multipart/alternative; boundary="1401107780.27E50E42.18474"; charset="us-ascii"


--1401107780.27E50E42.18474
Date: Mon, 26 May 2014 12:36:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76319

--- Comment #12 from D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> ---
I did file bug 76585 and 76990 too.

As there was no reply (no hard feelings) to my invitation for further
testing/developing (comment #8, paragraph 5), I have currently fallen back to
the nvidia binary blob.


Binary blob advantages (tested) :
- suspend/resume works

BB possible advantages (not tested) :
- performance
- stability

BB disadvantages :
- closed source
- no display in VT's
- switching between VT's required to restore screen display after screen power
off
- closed source

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401107780.27E50E42.18474
Date: Mon, 26 May 2014 12:36:20 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76319#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76319">bug 76319</a>
              from <span class="vcard"><a class="email" href="mailto:d-bugzilla&#64;moens.cc" title="D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"> <span class="fn">D. Moens</span></a>
</span></b>
        <pre>I did file <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] kernel oops and Xorg crash when resuming after suspend"
   href="show_bug.cgi?id=76585">bug 76585</a> and 76990 too.

As there was no reply (no hard feelings) to my invitation for further
testing/developing (<a href="show_bug.cgi?id=76319#c8">comment #8</a>, paragraph 5), I have currently fallen back to
the nvidia binary blob.


Binary blob advantages (tested) :
- suspend/resume works

BB possible advantages (not tested) :
- performance
- stability

BB disadvantages :
- closed source
- no display in VT's
- switching between VT's required to restore screen display after screen power
off
- closed source</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401107780.27E50E42.18474--

--===============1641501714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1641501714==--
