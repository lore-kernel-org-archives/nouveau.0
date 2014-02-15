From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] [NV34] [v3.14-rc1] nouveau: get 0x10000000
 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Sat, 15 Feb 2014 15:01:53 +0000
Message-ID: <bug-74613-8800-VpSuyPgk55@http.bugs.freedesktop.org/>
References: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0642592855=="
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


--===============0642592855==
Content-Type: multipart/alternative; boundary="1392476513.a8Cf3F61.18439"; charset="us-ascii"


--1392476513.a8Cf3F61.18439
Date: Sat, 15 Feb 2014 15:01:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

--- Comment #5 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@Ilia Mirkin: Ah, yes the next repo seems promising. Thank you.

About the 'old' master repo: Say, for example, stable was v3.8 and then this
machine would happily use it. Every week I would pull from this master branch
the patches for v3.9 based on the v3.8 tree.

These patches are localized in the nouveau driver, so I have quick rebuilds and
thus quick bisects. Problems are narrowed down easily and most importantly:
fast.

Using Linux his tree sometimes means doing a lot more bisects since a lot of
changes come in at once after two months. Furthermore, it's not just the
nouveau driver that changes but the entire tree. So bisecting would imply also
doing full rebuilds.

However, drm-nouveau-next seems to fill the gap which master left behind.

@Emil Velikov: Does not seem like it:

[gebruiker@delta linux]$ pacman -Qi libdrm
Naam : libdrm
Versie : 2.4.52-1
Beschrijving : Userspace interface to kernel DRM services
Architectuur : i686

ArchLinux is quick with it's updates. Which is really nice.

Ow well, on to the bisect then =)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392476513.a8Cf3F61.18439
Date: Sat, 15 Feb 2014 15:01:53 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>&#64;Ilia Mirkin: Ah, yes the next repo seems promising. Thank you.

About the 'old' master repo: Say, for example, stable was v3.8 and then this
machine would happily use it. Every week I would pull from this master branch
the patches for v3.9 based on the v3.8 tree.

These patches are localized in the nouveau driver, so I have quick rebuilds and
thus quick bisects. Problems are narrowed down easily and most importantly:
fast.

Using Linux his tree sometimes means doing a lot more bisects since a lot of
changes come in at once after two months. Furthermore, it's not just the
nouveau driver that changes but the entire tree. So bisecting would imply also
doing full rebuilds.

However, drm-nouveau-next seems to fill the gap which master left behind.

&#64;Emil Velikov: Does not seem like it:

[gebruiker&#64;delta linux]$ pacman -Qi libdrm
Naam : libdrm
Versie : 2.4.52-1
Beschrijving : Userspace interface to kernel DRM services
Architectuur : i686

ArchLinux is quick with it's updates. Which is really nice.

Ow well, on to the bisect then =)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392476513.a8Cf3F61.18439--

--===============0642592855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0642592855==--
