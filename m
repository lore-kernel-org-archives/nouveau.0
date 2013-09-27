From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Fri, 27 Sep 2013 16:12:05 +0000
Message-ID: <bug-69488-8800-LOUOS8Ua6e@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0188747961=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0188747961==
Content-Type: multipart/alternative; boundary="1380298325.4ED431.6118"; charset="us-ascii"


--1380298325.4ED431.6118
Date: Fri, 27 Sep 2013 16:12:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #8 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Works in discrete mode.

Probably unrelated but I can manage to make it lock up in Optimus configuration
if I plug in displayport while Xorg is running.
I see this in journalctl
Sep 27 08:57:46 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3
Sep 27 08:57:47 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3
Sep 27 08:57:47 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3

If I start the laptop with it already plugged in displayport works and it
doesn't lock up.  But I noticed that if I turn off the DP-1 and unplug it, the
card never powers down.
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380298325.4ED431.6118
Date: Fri, 27 Sep 2013 16:12:05 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>Works in discrete mode.

Probably unrelated but I can manage to make it lock up in Optimus configuration
if I plug in displayport while Xorg is running.
I see this in journalctl
Sep 27 08:57:46 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3
Sep 27 08:57:47 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3
Sep 27 08:57:47 sawako kernel: nouveau 0000:01:00.0: Refused to change power
state, currently in D3

If I start the laptop with it already plugged in displayport works and it
doesn't lock up.  But I noticed that if I turn off the DP-1 and unplug it, the
card never powers down.
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynPwr:0000:01:00.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380298325.4ED431.6118--

--===============0188747961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0188747961==--
