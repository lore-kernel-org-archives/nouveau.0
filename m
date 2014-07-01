From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Tue, 01 Jul 2014 01:14:27 +0000
Message-ID: <bug-76483-8800-9lg6gtLHto@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221548961=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0221548961==
Content-Type: multipart/alternative; boundary="1404177267.3138E4.29521"; charset="us-ascii"


--1404177267.3138E4.29521
Date: Tue, 1 Jul 2014 01:14:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #24 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #23)
> Created attachment 102016 [details]
> dmesg from garbled display
Not sure if/why it's causing a garbled display, but I did spot one bug from the
log that's causing link retraining when it's not needed:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=acc79e940a096657651980eb140176921a658e0c

> 
> The interesting thing here is that I waited for the dpms timeout, and the
> screen flashed and came back on more or less immediately, but clean.  It's
> as if something decided that the DPMS-off transition was "activity" and
> turned the screen back on, properly this time.  I don't think that's a
> driver issue though.

I hope this is just the monitor being really confused as a result of whatever
went wrong before it.  If it's not, your monitor is doing the wrong thing and
it's going to cause it to immediately resume from a power off (we can work
around the problem if it's necessary).  But, in your log, your monitor is
saying "help! i lost the link! retrain me!" in response to DP_SET_POWER_D3,
which it is *explicitly* (according to the DP spec, and, well, common sense)
not supposed to do.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404177267.3138E4.29521
Date: Tue, 1 Jul 2014 01:14:27 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c23">comment #23</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=102016" name="attach_102016" title="dmesg from garbled display">attachment 102016</a> <a href="attachment.cgi?id=102016&amp;action=edit" title="dmesg from garbled display">[details]</a></span>
&gt; dmesg from garbled display</span >
Not sure if/why it's causing a garbled display, but I did spot one bug from the
log that's causing link retraining when it's not needed:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=acc79e940a096657651980eb140176921a658e0c">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=acc79e940a096657651980eb140176921a658e0c</a>

<span class="quote">&gt; 
&gt; The interesting thing here is that I waited for the dpms timeout, and the
&gt; screen flashed and came back on more or less immediately, but clean.  It's
&gt; as if something decided that the DPMS-off transition was &quot;activity&quot; and
&gt; turned the screen back on, properly this time.  I don't think that's a
&gt; driver issue though.</span >

I hope this is just the monitor being really confused as a result of whatever
went wrong before it.  If it's not, your monitor is doing the wrong thing and
it's going to cause it to immediately resume from a power off (we can work
around the problem if it's necessary).  But, in your log, your monitor is
saying &quot;help! i lost the link! retrain me!&quot; in response to DP_SET_POWER_D3,
which it is *explicitly* (according to the DP spec, and, well, common sense)
not supposed to do.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404177267.3138E4.29521--

--===============0221548961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0221548961==--
