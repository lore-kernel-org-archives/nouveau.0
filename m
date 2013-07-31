From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Wed, 31 Jul 2013 12:28:06 +0000
Message-ID: <bug-67382-8800-suszjHWfdy@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266237425=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0266237425==
Content-Type: multipart/alternative; boundary="1375273686.c51Af4822.2551"; charset="us-ascii"


--1375273686.c51Af4822.2551
Date: Wed, 31 Jul 2013 12:28:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #17 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A fair bit of fairy stuff in here.

Without the bad patch, nouveau does not call the appropriate sense() function,
thus your system never looks for any other outputs and does not see the fathom
monitor connected to the dvi-i.

Can you provide a bit more information about the card - such as number and type
of outputs/connectors and if they work or not ?

i.e.
dvi-i -> working using a dvi-to-vga adaptor and a vga monitor
vga -> never tested
...

Additionally please attach your video bios [1]. Thanks


Cheers
Emil


[1] http://nouveau.freedesktop.org/wiki/DumpingVideoBios/
The debugfs or vbtracetool method is preferred

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375273686.c51Af4822.2551
Date: Wed, 31 Jul 2013 12:28:06 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>A fair bit of fairy stuff in here.

Without the bad patch, nouveau does not call the appropriate sense() function,
thus your system never looks for any other outputs and does not see the fathom
monitor connected to the dvi-i.

Can you provide a bit more information about the card - such as number and type
of outputs/connectors and if they work or not ?

i.e.
dvi-i -&gt; working using a dvi-to-vga adaptor and a vga monitor
vga -&gt; never tested
...

Additionally please attach your video bios [1]. Thanks


Cheers
Emil


[1] <a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios/">http://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a>
The debugfs or vbtracetool method is preferred</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375273686.c51Af4822.2551--

--===============0266237425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0266237425==--
