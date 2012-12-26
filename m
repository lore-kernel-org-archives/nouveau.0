From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] [NV4B] nVidia Geforce 7300 (NV4B) fails to
	resume
Date: Wed, 26 Dec 2012 12:02:11 +0000
Message-ID: <bug-23223-8800-DyebgKiuWP@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0683598870=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23223-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0683598870==
Content-Type: multipart/alternative; boundary="1356523331.Dff63f1.4388"; charset="us-ascii"


--1356523331.Dff63f1.4388
Date: Wed, 26 Dec 2012 12:02:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #9 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72138
  --> https://bugs.freedesktop.org/attachment.cgi?id=72138&action=edit
Dmesg v3.8rc1+Nouveau_HEAD+patch from #50121#c31 (s2disk cycle)

Suspend and resume cycle:

echo disk > /sys/power/state; dmesg -c >& v3.8rc1_nouveaudebug_cycle.txt

I see some errors in there. Hope it helps. Purged all the other old data, I
hope that's okay since this is new.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356523331.Dff63f1.4388
Date: Wed, 26 Dec 2012 12:02:11 +0000
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
   title="NEW --- - [NV4B] nVidia Geforce 7300 (NV4B) fails to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 (NV4B) fails to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72138" name="attach_72138" title="Dmesg v3.8rc1+Nouveau_HEAD+patch from #50121#c31 (s2disk cycle)">attachment 72138</a> <a href="attachment.cgi?id=72138&amp;action=edit" title="Dmesg v3.8rc1+Nouveau_HEAD+patch from #50121#c31 (s2disk cycle)">[details]</a></span>
Dmesg v3.8rc1+Nouveau_HEAD+patch from #50121#c31 (s2disk cycle)

Suspend and resume cycle:

echo disk &gt; /sys/power/state; dmesg -c &gt;&amp; v3.8rc1_nouveaudebug_cycle.txt

I see some errors in there. Hope it helps. Purged all the other old data, I
hope that's okay since this is new.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356523331.Dff63f1.4388--

--===============0683598870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0683598870==--
