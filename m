From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Sat, 14 Dec 2013 09:41:40 +0000
Message-ID: <bug-70354-8800-zenUoi6abE@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0569864676=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0569864676==
Content-Type: multipart/alternative; boundary="1387014100.432Bb812.833"; charset="us-ascii"


--1387014100.432Bb812.833
Date: Sat, 14 Dec 2013 09:41:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #18 from Joey 4712 <4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 90760
  --> https://bugs.freedesktop.org/attachment.cgi?id=90760&action=edit
Full dmesg on linux-3.13.0-1 - loading nouveau.ko built from Ben's repository

Thanks or your information about the HUB_INIT timeout fix in Ben's repository.

I tried it for Geforce GT 750M on Asus N750JV laptop on linux-3.13.0-1 but the
module fails to load with a lot of messages like "nouveau: Unknown symbol
ttm_bo_mmap (err 0)".

Attaching full dmesg output.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387014100.432Bb812.833
Date: Sat, 14 Dec 2013 09:41:40 +0000
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
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="Joey 4712 &lt;4712.joey&#64;gmail.com&gt;"> <span class="fn">Joey 4712</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90760" name="attach_90760" title="Full dmesg on linux-3.13.0-1 - loading nouveau.ko built from Ben's repository">attachment 90760</a> <a href="attachment.cgi?id=90760&amp;action=edit" title="Full dmesg on linux-3.13.0-1 - loading nouveau.ko built from Ben's repository">[details]</a></span>
Full dmesg on linux-3.13.0-1 - loading nouveau.ko built from Ben's repository

Thanks or your information about the HUB_INIT timeout fix in Ben's repository.

I tried it for Geforce GT 750M on Asus N750JV laptop on linux-3.13.0-1 but the
module fails to load with a lot of messages like &quot;nouveau: Unknown symbol
ttm_bo_mmap (err 0)&quot;.

Attaching full dmesg output.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387014100.432Bb812.833--

--===============0569864676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0569864676==--
