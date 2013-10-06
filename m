From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Sun, 06 Oct 2013 22:11:34 +0000
Message-ID: <bug-70208-8800-taMv0CZvwD@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2098670107=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2098670107==
Content-Type: multipart/alternative; boundary="1381097494.70A8231.5933"; charset="us-ascii"


--1381097494.70A8231.5933
Date: Sun, 6 Oct 2013 22:11:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #10 from 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 87217
  --> https://bugs.freedesktop.org/attachment.cgi?id=87217&action=edit
Full dmesg with additional stub opcode 0xaa patch

In addition to the count DISPLAY_RD devices patch now I applied this patch:

http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&id=5495e39fb3695182b9f2a72fe4169056cada37a1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381097494.70A8231.5933
Date: Sun, 6 Oct 2013 22:11:34 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="4712.joey&#64;gmail.com">4712.joey&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87217" name="attach_87217" title="Full dmesg with additional stub opcode 0xaa patch">attachment 87217</a> <a href="attachment.cgi?id=87217&amp;action=edit" title="Full dmesg with additional stub opcode 0xaa patch">[details]</a></span>
Full dmesg with additional stub opcode 0xaa patch

In addition to the count DISPLAY_RD devices patch now I applied this patch:

<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&amp;id=5495e39fb3695182b9f2a72fe4169056cada37a1">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&amp;id=5495e39fb3695182b9f2a72fe4169056cada37a1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381097494.70A8231.5933--

--===============2098670107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2098670107==--
