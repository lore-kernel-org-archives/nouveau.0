From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77574] Minor screen corruption on NVAF card
Date: Thu, 17 Apr 2014 14:24:58 +0000
Message-ID: <bug-77574-8800-RCPnWsiDqI@http.bugs.freedesktop.org/>
References: <bug-77574-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927721401=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77574-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0927721401==
Content-Type: multipart/alternative; boundary="1397744697.d24b1.9890"; charset="us-ascii"


--1397744697.d24b1.9890
Date: Thu, 17 Apr 2014 14:24:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77574

--- Comment #3 from Chernovsky Oleg <adonai-jwK0Lxh6SN0@public.gmane.org> ---
> You seem to have a nouveau.config=PCE0=0 somewhere.

I'll try to track it down. Could it be the issue?

> Are there other options set?

Where can I look at the list? /etc/modprobe.d/ is empty now

> Is the resume issue a new one? (i.e. did it work OK with older kernels?)

Earlier there was Debian. With kernel 3.10 it was worse - dashed line persisted
even on clean boot (without suspend -> wake).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397744697.d24b1.9890
Date: Thu, 17 Apr 2014 14:24:57 +0000
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
   title="NEW --- - Minor screen corruption on NVAF card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77574#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Minor screen corruption on NVAF card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77574">bug 77574</a>
              from <span class="vcard"><a class="email" href="mailto:adonai&#64;xaker.ru" title="Chernovsky Oleg &lt;adonai&#64;xaker.ru&gt;"> <span class="fn">Chernovsky Oleg</span></a>
</span></b>
        <pre><span class="quote">&gt; You seem to have a nouveau.config=PCE0=0 somewhere.</span >

I'll try to track it down. Could it be the issue?

<span class="quote">&gt; Are there other options set?</span >

Where can I look at the list? /etc/modprobe.d/ is empty now

<span class="quote">&gt; Is the resume issue a new one? (i.e. did it work OK with older kernels?)</span >

Earlier there was Debian. With kernel 3.10 it was worse - dashed line persisted
even on clean boot (without suspend -&gt; wake).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397744697.d24b1.9890--

--===============0927721401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0927721401==--
