From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Mon, 06 Jan 2014 00:58:22 +0000
Message-ID: <bug-72943-8800-yNlAZgaXam@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2104261526=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72943-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2104261526==
Content-Type: multipart/alternative; boundary="1388969902.66BB2.14092"; charset="us-ascii"


--1388969902.66BB2.14092
Date: Mon, 6 Jan 2014 00:58:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 91531
  --> https://bugs.freedesktop.org/attachment.cgi?id=91531&action=edit
make jump execution conditional

Please try this patch, I'm pretty sure it will help things out. The problem
VBIOS has the following snippet:

0xd9d0: 74 64 00                                       TIME     0x0064
0xd9d3: 75 10                                          CONDITION        0x10
0xd9d5: 38                                             NOT
0xd9d6: 6e 24 e8 00 00 ff ff ff ff 00 00 20 00         NV_REG   R[0x00e824] &=
0xffffffff |= 0x00200000
0xd9e3: 6e 20 e8 00 00 ff ff ff ff 00 00 00 80         NV_REG   R[0x00e820] &=
0xffffffff |= 0x80000000
0xd9f0: 6e 18 e8 00 00 ff ff ff ff 00 00 00 08         NV_REG   R[0x00e818] &=
0xffffffff |= 0x08000000
0xd9fd: 6e 18 e8 00 00 ff ff ff 7f 00 00 00 00         NV_REG   R[0x00e818] &=
0x7fffffff |= 0x00000000
0xda0a: 6e 18 e8 00 00 ff ff ff 7f 00 00 00 80         NV_REG   R[0x00e818] &=
0x7fffffff |= 0x80000000
0xda17: 74 64 00                                       TIME     0x0064
0xda1a: 5c d0 d9                                       JUMP     0xd9d0

With the old code, the JUMP was always executed and so there was no way to
break out of the loop. The new code makes JUMP conditional the same way
NV_REG/etc are.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388969902.66BB2.14092
Date: Mon, 6 Jan 2014 00:58:22 +0000
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
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">bug 72943</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91531" name="attach_91531" title="make jump execution conditional">attachment 91531</a> <a href="attachment.cgi?id=91531&amp;action=edit" title="make jump execution conditional">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=72943&amp;attachment=91531'>[review]</a>
make jump execution conditional

Please try this patch, I'm pretty sure it will help things out. The problem
VBIOS has the following snippet:

0xd9d0: 74 64 00                                       TIME     0x0064
0xd9d3: 75 10                                          CONDITION        0x10
0xd9d5: 38                                             NOT
0xd9d6: 6e 24 e8 00 00 ff ff ff ff 00 00 20 00         NV_REG   R[0x00e824] &amp;=
0xffffffff |= 0x00200000
0xd9e3: 6e 20 e8 00 00 ff ff ff ff 00 00 00 80         NV_REG   R[0x00e820] &amp;=
0xffffffff |= 0x80000000
0xd9f0: 6e 18 e8 00 00 ff ff ff ff 00 00 00 08         NV_REG   R[0x00e818] &amp;=
0xffffffff |= 0x08000000
0xd9fd: 6e 18 e8 00 00 ff ff ff 7f 00 00 00 00         NV_REG   R[0x00e818] &amp;=
0x7fffffff |= 0x00000000
0xda0a: 6e 18 e8 00 00 ff ff ff 7f 00 00 00 80         NV_REG   R[0x00e818] &amp;=
0x7fffffff |= 0x80000000
0xda17: 74 64 00                                       TIME     0x0064
0xda1a: 5c d0 d9                                       JUMP     0xd9d0

With the old code, the JUMP was always executed and so there was no way to
break out of the loop. The new code makes JUMP conditional the same way
NV_REG/etc are.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388969902.66BB2.14092--

--===============2104261526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2104261526==--
