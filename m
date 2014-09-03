From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Wed, 03 Sep 2014 04:29:50 +0000
Message-ID: <bug-70388-8800-RuJOKFPsO2@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1390132289=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1390132289==
Content-Type: multipart/alternative; boundary="1409718590.FD521.30482"; charset="us-ascii"


--1409718590.FD521.30482
Date: Wed, 3 Sep 2014 04:29:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #24 from Linas Vepstas <linasvepstas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Wow, vram_pushbuf=1 worked like a charm!  Please send patch upstream and/or
change docs now!

Explored every nook and cranny of Bios for the nth time, for n>10, and found no
mention of iommu or agp  or any iommu-sounding-like thing.

Will post dmesg and lspci for the successful boot, shortly.  I'll also try to
pull syslog for the previously-failing boot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409718590.FD521.30482
Date: Wed, 3 Sep 2014 04:29:50 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:linasvepstas&#64;gmail.com" title="Linas Vepstas &lt;linasvepstas&#64;gmail.com&gt;"> <span class="fn">Linas Vepstas</span></a>
</span></b>
        <pre>Wow, vram_pushbuf=1 worked like a charm!  Please send patch upstream and/or
change docs now!

Explored every nook and cranny of Bios for the nth time, for n&gt;10, and found no
mention of iommu or agp  or any iommu-sounding-like thing.

Will post dmesg and lspci for the successful boot, shortly.  I'll also try to
pull syslog for the previously-failing boot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409718590.FD521.30482--

--===============1390132289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1390132289==--
