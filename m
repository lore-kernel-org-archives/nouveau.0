From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57988] [regression][bisected][NV4E] LVDS output has
 offset to the right, part falling of is incorrectly painted on the left
Date: Fri, 07 Dec 2012 16:39:24 +0000
Message-ID: <bug-57988-8800-2ehMQBn3jx@http.bugs.freedesktop.org/>
References: <bug-57988-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1857262497=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57988-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1857262497==
Content-Type: multipart/alternative; boundary="1354898365.8005D1.19442"; charset="us-ascii"


--1354898365.8005D1.19442
Date: Fri, 7 Dec 2012 16:39:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57988

--- Comment #2 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 71140
  --> https://bugs.freedesktop.org/attachment.cgi?id=71140&action=edit
Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)+remove '#if 0 /
#endif' as mentioned by mupuf

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354898365.8005D1.19442
Date: Fri, 7 Dec 2012 16:39:25 +0000
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
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is incorrectly painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is incorrectly painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988">bug 57988</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=71140" name="attach_71140" title="Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)+remove '#if 0 / #endif' as mentioned by mupuf">attachment 71140</a> <a href="attachment.cgi?id=71140&amp;action=edit" title="Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)+remove '#if 0 / #endif' as mentioned by mupuf">[details]</a></span>
Dmesg of regression: 3.7-rc8+nouveau(implement opcode 0xa9)+remove '#if 0 /
#endif' as mentioned by mupuf</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354898365.8005D1.19442--

--===============1857262497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1857262497==--
