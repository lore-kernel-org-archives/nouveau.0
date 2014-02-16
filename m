From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] [NV34] [v3.14-rc1] nouveau: get 0x10000000
 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Sun, 16 Feb 2014 08:24:34 +0000
Message-ID: <bug-74613-8800-l0BE37J7Y6@http.bugs.freedesktop.org/>
References: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1227865055=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1227865055==
Content-Type: multipart/alternative; boundary="1392539074.1CA5FeB2.14298"; charset="us-ascii"


--1392539074.1CA5FeB2.14298
Date: Sun, 16 Feb 2014 08:24:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #9)
> Yes, that fixes it.

Awesome! I sent a patch to the ML + cc'd you (I assume you got it) a few hours
ago. Feel free to respond with a Tested-by. I'll close this bug when the patch
hits mainline.

Thanks for bisecting, and sorry that you're running into so many problems!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392539074.1CA5FeB2.14298
Date: Sun, 16 Feb 2014 08:24:34 +0000
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
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74613#c9">comment #9</a>)
<span class="quote">&gt; Yes, that fixes it.</span >

Awesome! I sent a patch to the ML + cc'd you (I assume you got it) a few hours
ago. Feel free to respond with a Tested-by. I'll close this bug when the patch
hits mainline.

Thanks for bisecting, and sorry that you're running into so many problems!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392539074.1CA5FeB2.14298--

--===============1227865055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1227865055==--
