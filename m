From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49786] In xterm,
 some rectangles are not redrawn when the window is partly covered
Date: Wed, 21 Aug 2013 10:27:54 +0000
Message-ID: <bug-49786-8800-Szc2a9TkL3@http.bugs.freedesktop.org/>
References: <bug-49786-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716213713=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49786-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1716213713==
Content-Type: multipart/alternative; boundary="1377080874.f536dad1.18388"; charset="us-ascii"


--1377080874.f536dad1.18388
Date: Wed, 21 Aug 2013 10:27:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49786

--- Comment #9 from Vincent Lefevre <vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> ---
(In reply to comment #4)
> Can you confirm that this happens with the latest DDX (1.0.9)? If so, we'll
> need a bit more information -- please attach both a dmesg + Xorg.0.log for
> your system. (Even if there are no errors, they contain information that
> describes your system.)

The problem still occurs. I don't know what is the DDX, but Xorg.0.log says:

[    47.996] (II) Module nouveau: vendor="X.Org Foundation"
[    47.996]    compiled for 1.12.4, module version = 1.0.9
[    47.996]    Module class: X.Org Video Driver
[    47.996]    ABI class: X.Org Video Driver, version 12.1

I've attached both dmesg output and the Xorg.0.log file after rebooting the
machine and testing.

I've also attached a new shell script to test: it automatically opens the xterm
windows at the right place (bitmap fonts may need to be enabled, otherwise I
don't know if the bug still occurs). It needs the base64 utility (from the
coreutils) to output the data to the first xterm window. Just wait for a few
seconds for the second xterm then the text to appear.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377080874.f536dad1.18388
Date: Wed, 21 Aug 2013 10:27:54 +0000
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
   title="NEW --- - In xterm, some rectangles are not redrawn when the window is partly covered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49786#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - In xterm, some rectangles are not redrawn when the window is partly covered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49786">bug 49786</a>
              from <span class="vcard"><a class="email" href="mailto:vincent-fdt&#64;vinc17.net" title="Vincent Lefevre &lt;vincent-fdt&#64;vinc17.net&gt;"> <span class="fn">Vincent Lefevre</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=49786#c4">comment #4</a>)
<span class="quote">&gt; Can you confirm that this happens with the latest DDX (1.0.9)? If so, we'll
&gt; need a bit more information -- please attach both a dmesg + Xorg.0.log for
&gt; your system. (Even if there are no errors, they contain information that
&gt; describes your system.)</span >

The problem still occurs. I don't know what is the DDX, but Xorg.0.log says:

[    47.996] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[    47.996]    compiled for 1.12.4, module version = 1.0.9
[    47.996]    Module class: X.Org Video Driver
[    47.996]    ABI class: X.Org Video Driver, version 12.1

I've attached both dmesg output and the Xorg.0.log file after rebooting the
machine and testing.

I've also attached a new shell script to test: it automatically opens the xterm
windows at the right place (bitmap fonts may need to be enabled, otherwise I
don't know if the bug still occurs). It needs the base64 utility (from the
coreutils) to output the data to the first xterm window. Just wait for a few
seconds for the second xterm then the text to appear.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377080874.f536dad1.18388--

--===============1716213713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1716213713==--
