From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Sun, 01 Dec 2013 21:11:26 +0000
Message-ID: <bug-71455-8800-VL4LjSmSj6@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870926041=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1870926041==
Content-Type: multipart/alternative; boundary="1385932286.eAEd2.11431"; charset="us-ascii"


--1385932286.eAEd2.11431
Date: Sun, 1 Dec 2013 21:11:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

--- Comment #5 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #3)
> The fan PWM setting is derived from priv->cstate. The value it gets from
> there is zero. So the setting of PWM for NV40 is working correctly,
> "inverting" the percent setting to get the value set in 0xb20010f0. Probably
> priv->cstate is never initialized. I'll bet that wasn't intentional.
> 
Not intentional. But also found and fixed already in -rc1.

Ben. 

> Bob

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385932286.eAEd2.11431
Date: Sun, 1 Dec 2013 21:11:26 +0000
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
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71455#c3">comment #3</a>)
<span class="quote">&gt; The fan PWM setting is derived from priv-&gt;cstate. The value it gets from
&gt; there is zero. So the setting of PWM for NV40 is working correctly,
&gt; &quot;inverting&quot; the percent setting to get the value set in 0xb20010f0. Probably
&gt; priv-&gt;cstate is never initialized. I'll bet that wasn't intentional.
&gt; </span >
Not intentional. But also found and fixed already in -rc1.

Ben. 

<span class="quote">&gt; Bob</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385932286.eAEd2.11431--

--===============1870926041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1870926041==--
