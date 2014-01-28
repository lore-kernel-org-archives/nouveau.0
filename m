From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Tue, 28 Jan 2014 21:30:33 +0000
Message-ID: <bug-21273-8800-x7Fj3xyauy@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1110180885=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1110180885==
Content-Type: multipart/alternative; boundary="1390944633.CC3fa1.12739"; charset="us-ascii"


--1390944633.CC3fa1.12739
Date: Tue, 28 Jan 2014 21:30:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #101 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 92956
  --> https://bugs.freedesktop.org/attachment.cgi?id=92956&action=edit
Kernel log for fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);

Monitor suspends with patch.
+       if (of_machine_is_compatible("PowerMac3,6")) {
+               fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);
+               return;
+       }

I could see log in without patch and I saw symbols on the screen. I'll recheck
reaction on big output and switching virtual consoles.
I will try patch from comment 98.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390944633.CC3fa1.12739
Date: Tue, 28 Jan 2014 21:30:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c101">Comment # 101</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92956" name="attach_92956" title="Kernel log for fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);">attachment 92956</a> <a href="attachment.cgi?id=92956&amp;action=edit" title="Kernel log for fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);">[details]</a></span>
Kernel log for fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);

Monitor suspends with patch.
+       if (of_machine_is_compatible(&quot;PowerMac3,6&quot;)) {
+               fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 2, 2);
+               return;
+       }

I could see log in without patch and I saw symbols on the screen. I'll recheck
reaction on big output and switching virtual consoles.
I will try patch from <a href="show_bug.cgi?id=21273#c98">comment 98</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390944633.CC3fa1.12739--

--===============1110180885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1110180885==--
