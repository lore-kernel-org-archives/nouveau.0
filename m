From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sun, 08 Sep 2013 16:22:12 +0000
Message-ID: <bug-21273-8800-pHjf3hyalu@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510293793=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1510293793==
Content-Type: multipart/alternative; boundary="1378657332.3Bbeff11.7862"; charset="us-ascii"


--1378657332.3Bbeff11.7862
Date: Sun, 8 Sep 2013 16:22:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #89 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 85441
  --> https://bugs.freedesktop.org/attachment.cgi?id=85441&action=edit
log of loading with workaround

I return workaround to code for PowerMac 3,6:
+    if (of_machine_is_compatible("PowerMac3,6")) {
+        fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);
+        fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, 2);
+        return;
+    }
Unfortunately, it doesn't help. Also, there is output card0-DVI-I-1.
cat classdrm 
card0
card0-DVI-I-1
controlD64
ttm
version

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378657332.3Bbeff11.7862
Date: Sun, 8 Sep 2013 16:22:12 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c89">Comment # 89</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85441" name="attach_85441" title="log of loading with workaround">attachment 85441</a> <a href="attachment.cgi?id=85441&amp;action=edit" title="log of loading with workaround">[details]</a></span>
log of loading with workaround

I return workaround to code for PowerMac 3,6:
+    if (of_machine_is_compatible(&quot;PowerMac3,6&quot;)) {
+        fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);
+        fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, 2);
+        return;
+    }
Unfortunately, it doesn't help. Also, there is output card0-DVI-I-1.
cat classdrm 
card0
card0-DVI-I-1
controlD64
ttm
version</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378657332.3Bbeff11.7862--

--===============1510293793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1510293793==--
