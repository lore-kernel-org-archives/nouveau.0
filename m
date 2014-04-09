From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Wed, 09 Apr 2014 23:54:32 +0000
Message-ID: <bug-76732-8800-DOu9rS6aGK@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1185362681=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1185362681==
Content-Type: multipart/alternative; boundary="1397087672.22dbA2.14157"; charset="us-ascii"


--1397087672.22dbA2.14157
Date: Wed, 9 Apr 2014 23:54:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #38 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #37)
> I think I should add that it happens only if I boot in pure EFI mode. If I
> boot in EFI mode with CSM enabled, on the second load it behaves as usual.
> 
> I tried loading nouveau at boot with "config=NvForcePost=1". This seems to
> workaround the problem for now. Also X starts corectly.
> 
> Will do some more testing...

Are you booting on a Macbook with something like rEFIt or rEFInd? How are you
booting pure CSM if so? I'd like to try to duplicate this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397087672.22dbA2.14157
Date: Wed, 9 Apr 2014 23:54:32 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c37">comment #37</a>)
<span class="quote">&gt; I think I should add that it happens only if I boot in pure EFI mode. If I
&gt; boot in EFI mode with CSM enabled, on the second load it behaves as usual.
&gt; 
&gt; I tried loading nouveau at boot with &quot;config=NvForcePost=1&quot;. This seems to
&gt; workaround the problem for now. Also X starts corectly.
&gt; 
&gt; Will do some more testing...</span >

Are you booting on a Macbook with something like rEFIt or rEFInd? How are you
booting pure CSM if so? I'd like to try to duplicate this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397087672.22dbA2.14157--

--===============1185362681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1185362681==--
