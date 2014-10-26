From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85160] [NV94] INVALID_STATE error,
 X fails to start on GeForce 9600 GT with dual monitors,
 kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
Date: Sun, 26 Oct 2014 13:29:32 +0000
Message-ID: <bug-85160-8800-Xhm6Dq41NM@http.bugs.freedesktop.org/>
References: <bug-85160-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1922203455=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85160-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1922203455==
Content-Type: multipart/alternative; boundary="1414330172.64ebc32.14009"; charset="UTF-8"


--1414330172.64ebc32.14009
Date: Sun, 26 Oct 2014 13:29:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85160

--- Comment #6 from Zlatko Calusic <zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org> ---
I have the same problem in 3.18-rc1, and can confirm that the issue is fixed if
I revert 1dce62640. Also GF 9600 GT and also dual monitor setup.

In my case, my primary display (DVI) would go blank right after switching to FB
and monitor would go to powersave. Reverting the mentioned commit fixes the
issue completely.

If there's an updated patch, I'm willing to test it before it goes mainstream.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414330172.64ebc32.14009
Date: Sun, 26 Oct 2014 13:29:32 +0000
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
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160">bug 85160</a>
              from <span class="vcard"><a class="email" href="mailto:zcalusic&#64;bitsync.net" title="Zlatko Calusic &lt;zcalusic&#64;bitsync.net&gt;"> <span class="fn">Zlatko Calusic</span></a>
</span></b>
        <pre>I have the same problem in 3.18-rc1, and can confirm that the issue is fixed if
I revert 1dce62640. Also GF 9600 GT and also dual monitor setup.

In my case, my primary display (DVI) would go blank right after switching to FB
and monitor would go to powersave. Reverting the mentioned commit fixes the
issue completely.

If there's an updated patch, I'm willing to test it before it goes mainstream.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414330172.64ebc32.14009--

--===============1922203455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1922203455==--
