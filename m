From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73445] [NV4E] regression with 3.13 -rcX: glxgears
 etc. hard lockup/freezes machine, on 3.12 everything works
Date: Thu, 09 Jan 2014 19:36:24 +0000
Message-ID: <bug-73445-8800-3PCKN8YpAA@http.bugs.freedesktop.org/>
References: <bug-73445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1304623014=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1304623014==
Content-Type: multipart/alternative; boundary="1389296184.abfcf7B1.384"; charset="us-ascii"


--1389296184.abfcf7B1.384
Date: Thu, 9 Jan 2014 19:36:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73445

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you ssh into the machine when this happens? If so, can you look at dmesg?
If not, the output of dmesg even before the hang may prove interesting.

This seems like it'd be pretty easy to bisect -- can you give that a shot? (git
bisect... if you're not familiar with it, there are dozens of guides online, as
well as a good man page)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389296184.abfcf7B1.384
Date: Thu, 9 Jan 2014 19:36:24 +0000
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
   title="NEW --- - [NV4E] regression with 3.13 -rcX: glxgears etc. hard lockup/freezes machine, on 3.12 everything works"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73445#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] regression with 3.13 -rcX: glxgears etc. hard lockup/freezes machine, on 3.12 everything works"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73445">bug 73445</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you ssh into the machine when this happens? If so, can you look at dmesg?
If not, the output of dmesg even before the hang may prove interesting.

This seems like it'd be pretty easy to bisect -- can you give that a shot? (git
bisect... if you're not familiar with it, there are dozens of guides online, as
well as a good man page)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389296184.abfcf7B1.384--

--===============1304623014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1304623014==--
