From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Wed, 03 Oct 2012 22:38:33 +0000
Message-ID: <bug-46557-8800-1Qt9a7J3xO@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0054355873=="
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


--===============0054355873==
Content-Type: multipart/alternative; boundary="1349303914.6dD54.27065"; charset="us-ascii"


--1349303914.6dD54.27065
Date: Wed, 3 Oct 2012 22:38:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #24 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #23)
> here is the output for nouveau from dmesg
> 
> ...
> [    1.098755] nouveau 0000:00:05.0: >setting latency timer to 64
> ...
> [   67.077190] nouveau E[     DRM] fail ttm_validate
> [   67.077198] nouveau E[     DRM] validate vram_list
> [   67.077208] nouveau E[     DRM] validate: -12 (ENOMEM)
> ...

You have allocated only 32MB of RAM for the GPU

Try bumping it to 128 or 256MB it should resolve your issue

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349303914.6dD54.27065
Date: Wed, 3 Oct 2012 22:38:34 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=46557#c23">comment #23</a>)
<span class="quote">&gt; here is the output for nouveau from dmesg
&gt; 
&gt; ...
&gt; [    1.098755] nouveau 0000:00:05.0: &gt;setting latency timer to 64
&gt; ...
&gt; [   67.077190] nouveau E[     DRM] fail ttm_validate
&gt; [   67.077198] nouveau E[     DRM] validate vram_list
&gt; [   67.077208] nouveau E[     DRM] validate: -12 (ENOMEM)
&gt; ...</span >

You have allocated only 32MB of RAM for the GPU

Try bumping it to 128 or 256MB it should resolve your issue</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349303914.6dD54.27065--

--===============0054355873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0054355873==--
