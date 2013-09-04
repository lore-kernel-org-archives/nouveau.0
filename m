From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49727] [nv30 gallium] wine 1.5.2 and 3Dmark2001se
 displays only black screen with FPS, on nv43/AGP
Date: Wed, 04 Sep 2013 03:03:58 +0000
Message-ID: <bug-49727-8800-QOBJUap8kE@http.bugs.freedesktop.org/>
References: <bug-49727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0672352770=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0672352770==
Content-Type: multipart/alternative; boundary="1378263838.50bF1F1.2812"; charset="us-ascii"


--1378263838.50bF1F1.2812
Date: Wed, 4 Sep 2013 03:03:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49727

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 85162
  --> https://bugs.freedesktop.org/attachment.cgi?id=85162&action=edit
disable ARB_framebuffer_object, print when trying to do both swizzle and linear

Does this patch help? If not, do you see "rt_format is both swizzled and
linear" getting printed a bunch (in a debug build... change it to a
_debug_printf(...) if you're doing a non-debug build)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378263838.50bF1F1.2812
Date: Wed, 4 Sep 2013 03:03:58 +0000
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
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727">bug 49727</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85162" name="attach_85162" title="disable ARB_framebuffer_object, print when trying to do both swizzle and linear">attachment 85162</a> <a href="attachment.cgi?id=85162&amp;action=edit" title="disable ARB_framebuffer_object, print when trying to do both swizzle and linear">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=49727&amp;attachment=85162'>[review]</a>
disable ARB_framebuffer_object, print when trying to do both swizzle and linear

Does this patch help? If not, do you see &quot;rt_format is both swizzled and
linear&quot; getting printed a bunch (in a debug build... change it to a
_debug_printf(...) if you're doing a non-debug build)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378263838.50bF1F1.2812--

--===============0672352770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0672352770==--
