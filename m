From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Wed, 08 Jan 2014 01:28:04 +0000
Message-ID: <bug-72943-8800-O0XgDI5soG@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0511778627=="
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


--===============0511778627==
Content-Type: multipart/alternative; boundary="1389144484.dbc3F82.3448"; charset="us-ascii"


--1389144484.dbc3F82.3448
Date: Wed, 8 Jan 2014 01:28:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, I downloaded

https://www.dropbox.com/sh/e77p700zr8g1v4z/kb_av1ZSS6/127.0.0.1-2014.01.07-20%3A43%3A35

Which includes

kernel-debuginfo-common-x86_64-3.13.0-0.rc6.git0.1.fc20.x86_64.rpm

Which contains the source. I can only assume that this is the source that you
built from. And the drivers/gpu/drm/nouveau/core/subdev/bios/init.c in there
does not appear to have the patch applied to init_jump.

So I'd like to ask again... can you check that the kernel you're booting is the
kernel that has the patch applied to it? Am I misunderstanding the situation?
You could prove it to yourself by modifying some common print, for example,
that you would be able to identify from kernel messages. Or you could just
build the kernel directly without fancy tools that obscure these things.

(I did try loading the nouveau.ko.debug in gdb, but I think it _only_ contains
the debug symbols, since the init_jump function was full of add    %al,(%rax)
instructions which I think is just opcode 0.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389144484.dbc3F82.3448
Date: Wed, 8 Jan 2014 01:28:04 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">bug 72943</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, I downloaded

<a href="https://www.dropbox.com/sh/e77p700zr8g1v4z/kb_av1ZSS6/127.0.0.1-2014.01.07-20%3A43%3A35">https://www.dropbox.com/sh/e77p700zr8g1v4z/kb_av1ZSS6/127.0.0.1-2014.01.07-20%3A43%3A35</a>

Which includes

kernel-debuginfo-common-x86_64-3.13.0-0.rc6.git0.1.fc20.x86_64.rpm

Which contains the source. I can only assume that this is the source that you
built from. And the drivers/gpu/drm/nouveau/core/subdev/bios/init.c in there
does not appear to have the patch applied to init_jump.

So I'd like to ask again... can you check that the kernel you're booting is the
kernel that has the patch applied to it? Am I misunderstanding the situation?
You could prove it to yourself by modifying some common print, for example,
that you would be able to identify from kernel messages. Or you could just
build the kernel directly without fancy tools that obscure these things.

(I did try loading the nouveau.ko.debug in gdb, but I think it _only_ contains
the debug symbols, since the init_jump function was full of add    %al,(%rax)
instructions which I think is just opcode 0.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389144484.dbc3F82.3448--

--===============0511778627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0511778627==--
