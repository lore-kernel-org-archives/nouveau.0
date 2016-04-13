From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 13 Apr 2016 16:23:31 +0000
Message-ID: <bug-93629-8800-QnLXgfjZOr@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217908552=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0217908552==
Content-Type: multipart/alternative; boundary="14605646110.cD7fBDF.32240";
 charset="UTF-8"


--14605646110.cD7fBDF.32240
Date: Wed, 13 Apr 2016 16:23:30 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

Dan Moulding <dmoulding-BUHhN+a2lJ4@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dmoulding-BUHhN+a2lJ4@public.gmane.org

--- Comment #16 from Dan Moulding <dmoulding-BUHhN+a2lJ4@public.gmane.org> ---
I'm experiencing this bug with kernel 4.4.6 and GK106 (GeForce GTX 645 OEM).

For what it's worth, I've been experiencing this same bug for about two years,
ever since kernel 3.12 (I was on kernel 3.10 prior to that and never
experienced the bug). After each kernel upgrade I've done, I usually test the
built-in firmware to see if the problem is still there. For a while, I thought
the bug was gone as of the 4.4 kernel because I hadn't experienced the problem
for a long time on 4.4 with the built-in firmware. But recently I upgraded my
desktop environment to KDE Plasma 5 and now I've experienced the lockup twice
in less than a 24-hour period.

I just switched back to the proprietary firmware (after moving/renaming the
binary blobs to match the names that the new version of the driver looks for).

I'm willing to test the built-in firmware more, in order to help debug this
longstanding problem. Is there something I can do to help gather more
information (traces, enable debug logging, etc)?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14605646110.cD7fBDF.32240
Date: Wed, 13 Apr 2016 16:23:31 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:dmoulding&#64;me.com" title="Dan Moulding &lt;dmoulding&#64;me.com&gt;"> <span class="fn">Dan Moulding</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>dmoulding&#64;me.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:dmoulding&#64;me.com" title="Dan Moulding &lt;dmoulding&#64;me.com&gt;"> <span class="fn">Dan Moulding</span></a>
</span></b>
        <pre>I'm experiencing this bug with kernel 4.4.6 and GK106 (GeForce GTX 645 OEM).

For what it's worth, I've been experiencing this same bug for about two years,
ever since kernel 3.12 (I was on kernel 3.10 prior to that and never
experienced the bug). After each kernel upgrade I've done, I usually test the
built-in firmware to see if the problem is still there. For a while, I thought
the bug was gone as of the 4.4 kernel because I hadn't experienced the problem
for a long time on 4.4 with the built-in firmware. But recently I upgraded my
desktop environment to KDE Plasma 5 and now I've experienced the lockup twice
in less than a 24-hour period.

I just switched back to the proprietary firmware (after moving/renaming the
binary blobs to match the names that the new version of the driver looks for).

I'm willing to test the built-in firmware more, in order to help debug this
longstanding problem. Is there something I can do to help gather more
information (traces, enable debug logging, etc)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14605646110.cD7fBDF.32240--

--===============0217908552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0217908552==--
