From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [any/all(?) cards below nv50(?)] libdrm built
 with gcc4.8 causes crashes/lockups during normal operation,
 and resume from disk/memory
Date: Thu, 07 Nov 2013 10:31:40 +0000
Message-ID: <bug-71116-8800-5TYQAtXaRw@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0058422481=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0058422481==
Content-Type: multipart/alternative; boundary="1383820300.cC7a2.8672"; charset="us-ascii"


--1383820300.cC7a2.8672
Date: Thu, 7 Nov 2013 10:31:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #20 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
Created attachment 88817
  --> https://bugs.freedesktop.org/attachment.cgi?id=88817&action=edit
hack to force defined behavior

As I feared, recompiling only pushbuf.c with gcc-4.7 fixes this bug. So
something in pushbuf.c is miscompiled. Unfortunately it's also the biggest
abuser of post increment ops.

A simple workaround seems to be this patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383820300.cC7a2.8672
Date: Thu, 7 Nov 2013 10:31:40 +0000
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
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88817" name="attach_88817" title="hack to force defined behavior">attachment 88817</a> <a href="attachment.cgi?id=88817&amp;action=edit" title="hack to force defined behavior">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=71116&amp;attachment=88817'>[review]</a>
hack to force defined behavior

As I feared, recompiling only pushbuf.c with gcc-4.7 fixes this bug. So
something in pushbuf.c is miscompiled. Unfortunately it's also the biggest
abuser of post increment ops.

A simple workaround seems to be this patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383820300.cC7a2.8672--

--===============0058422481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0058422481==--
