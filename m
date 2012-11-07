From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Wed, 07 Nov 2012 12:19:34 +0000
Message-ID: <bug-46557-8800-2Ep3FcCejj@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0892076375=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0892076375==
Content-Type: multipart/alternative; boundary="1352290774.eca82C854.25204"; charset="us-ascii"


--1352290774.eca82C854.25204
Date: Wed, 7 Nov 2012 12:19:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #26 from m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Judging from the errors, I'd say it can't look up the handle it created.

Diving into the old dma implementation seems 

The handles for vram and gart could not be looked up, so guessing an invalid
entry was used.

Does setting dma_bits = 32 inside drivers/gpu/drm/nouveau/core/subdev/vm/nv44.c
help?

The old nouveau driver seemed to have commented out the part about 39-bits
support for cards < nv50.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352290774.eca82C854.25204
Date: Wed, 7 Nov 2012 12:19:34 +0000
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
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="m.b.lankhorst&#64;gmail.com">m.b.lankhorst&#64;gmail.com</a>
</span></b>
        <pre>Judging from the errors, I'd say it can't look up the handle it created.

Diving into the old dma implementation seems 

The handles for vram and gart could not be looked up, so guessing an invalid
entry was used.

Does setting dma_bits = 32 inside drivers/gpu/drm/nouveau/core/subdev/vm/nv44.c
help?

The old nouveau driver seemed to have commented out the part about 39-bits
support for cards &lt; nv50.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352290774.eca82C854.25204--

--===============0892076375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0892076375==--
