From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Tue, 17 Dec 2013 22:22:05 +0000
Message-ID: <bug-72180-8800-oC5qV0XXO4@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1543815623=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1543815623==
Content-Type: multipart/alternative; boundary="1387318925.e0454.8508"; charset="us-ascii"


--1387318925.e0454.8508
Date: Tue, 17 Dec 2013 22:22:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #21 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Whether the firmware needs to be in the initrd or not depends on how you have
it  set up. It needs to be there when the nouveau code is initialized (if you
have a module, that means when the module is loaded, if it's built-in, then it
needs to be added to the kernel image itself with the ADDITIONAL_FIRMWARE thing
or whatever it's called).

e.g. the way I set up my initrd is that it does next to nothing, just asks for
a password, decrypts the partition, mounts it, and swaps it in as the 'new'
root. I never need to touch it (unless I want to make changes to the decryption
logic). Modules are loaded with my regular '/' in place.

Most distros prefer the complex route and have their initrd's load everything,
which in turn means that the firmware needs to be in the intird, and the initrd
needs to be updated for every kernel. [Aside: This makes sense when you're
creating something that must work on every hardware combination ever imagined
(and not) whereby you don't want to build every driver in, but you do want to
support various esoteric devices that are may be required for booting, like
disk or network. And once you do that, might as well do everything there. But
it's very rare that I solder some crazy raid controller into my laptop, so it
doesn't really make sense for more tailored setups.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387318925.e0454.8508
Date: Tue, 17 Dec 2013 22:22:05 +0000
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
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Whether the firmware needs to be in the initrd or not depends on how you have
it  set up. It needs to be there when the nouveau code is initialized (if you
have a module, that means when the module is loaded, if it's built-in, then it
needs to be added to the kernel image itself with the ADDITIONAL_FIRMWARE thing
or whatever it's called).

e.g. the way I set up my initrd is that it does next to nothing, just asks for
a password, decrypts the partition, mounts it, and swaps it in as the 'new'
root. I never need to touch it (unless I want to make changes to the decryption
logic). Modules are loaded with my regular '/' in place.

Most distros prefer the complex route and have their initrd's load everything,
which in turn means that the firmware needs to be in the intird, and the initrd
needs to be updated for every kernel. [Aside: This makes sense when you're
creating something that must work on every hardware combination ever imagined
(and not) whereby you don't want to build every driver in, but you do want to
support various esoteric devices that are may be required for booting, like
disk or network. And once you do that, might as well do everything there. But
it's very rare that I solder some crazy raid controller into my laptop, so it
doesn't really make sense for more tailored setups.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387318925.e0454.8508--

--===============1543815623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1543815623==--
