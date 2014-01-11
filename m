From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sat, 11 Jan 2014 11:41:13 +0000
Message-ID: <bug-21273-8800-0MKzm8bvDE@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1879551721=="
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


--===============1879551721==
Content-Type: multipart/alternative; boundary="1389440473.0A4370D1.10757"; charset="us-ascii"


--1389440473.0A4370D1.10757
Date: Sat, 11 Jan 2014 11:41:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #95 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 91856
  --> https://bugs.freedesktop.org/attachment.cgi?id=91856&action=edit
log of 3.10.0 kernel

I tried fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 1); on the
kernel 3.0.10. Monitor suspended after showing white lines.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389440473.0A4370D1.10757
Date: Sat, 11 Jan 2014 11:41:13 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c95">Comment # 95</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91856" name="attach_91856" title="log of 3.10.0 kernel">attachment 91856</a> <a href="attachment.cgi?id=91856&amp;action=edit" title="log of 3.10.0 kernel">[details]</a></span>
log of 3.10.0 kernel

I tried fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 1); on the
kernel 3.0.10. Monitor suspended after showing white lines.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389440473.0A4370D1.10757--

--===============1879551721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1879551721==--
