From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73342] [NV86] yuy2 overlay in mame displays as black
Date: Sun, 19 Jan 2014 20:36:54 +0000
Message-ID: <bug-73342-8800-9tz48i6zOd@http.bugs.freedesktop.org/>
References: <bug-73342-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1027465940=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73342-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1027465940==
Content-Type: multipart/alternative; boundary="1390163814.aD45FCCc1.3053"; charset="us-ascii"


--1390163814.aD45FCCc1.3053
Date: Sun, 19 Jan 2014 20:36:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73342

--- Comment #4 from fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---

>  - hardware 1: Ubuntu 13.04 with nouveau (from ubuntu 13.04 repository) and
> geforce 8500GT Chipset: G86 (NV86) , Family : NV50

Sorry, this is wrong, actually the ubuntu 13.04 (and only the 13.04) is using
the nvidia proprietary driver, not the nouveau.

One more test that works:

 - hardware 1: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and 
offboard geforce 7200GS Chipset: G72 (NV46) , Family : NV40

The problem is only with geforce 8500GT Chipset: G86 (NV86) , Family : NV50
And this same board works fine in ubuntu 11.10 with kernel 3.0 and nouveau from
11.10 repos.

So there's some regression between kernel 3.0 and 3.11 (tested w/ 3.12 too)
and/or nouveau versions between ubuntu 11.10 and ubuntu 13.10 with this
specific geforce 8500GT Chipset: G86 (NV86) , Family : NV50 when try to work
the YUV overlay scaling in mame

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390163814.aD45FCCc1.3053
Date: Sun, 19 Jan 2014 20:36:54 +0000
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
   title="NEW --- - [NV86] yuy2 overlay in mame displays as black"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73342#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] yuy2 overlay in mame displays as black"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73342">bug 73342</a>
              from <span class="vcard"><a class="email" href="mailto:fbs777&#64;gmail.com" title="fbs777&#64;gmail.com">fbs777&#64;gmail.com</a>
</span></b>
        <pre>
<span class="quote">&gt;  - hardware 1: Ubuntu 13.04 with nouveau (from ubuntu 13.04 repository) and
&gt; geforce 8500GT Chipset: G86 (NV86) , Family : NV50</span >

Sorry, this is wrong, actually the ubuntu 13.04 (and only the 13.04) is using
the nvidia proprietary driver, not the nouveau.

One more test that works:

 - hardware 1: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and 
offboard geforce 7200GS Chipset: G72 (NV46) , Family : NV40

The problem is only with geforce 8500GT Chipset: G86 (NV86) , Family : NV50
And this same board works fine in ubuntu 11.10 with kernel 3.0 and nouveau from
11.10 repos.

So there's some regression between kernel 3.0 and 3.11 (tested w/ 3.12 too)
and/or nouveau versions between ubuntu 11.10 and ubuntu 13.10 with this
specific geforce 8500GT Chipset: G86 (NV86) , Family : NV50 when try to work
the YUV overlay scaling in mame</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390163814.aD45FCCc1.3053--

--===============1027465940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1027465940==--
