From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Sat, 03 May 2014 21:31:55 +0000
Message-ID: <bug-78116-8800-XQz0KqsM3F@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229123407=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1229123407==
Content-Type: multipart/alternative; boundary="1399152714.Cc3A2.29011"; charset="us-ascii"


--1399152714.Cc3A2.29011
Date: Sat, 3 May 2014 21:31:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #3 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #2)
> I'm using Arch Linux so I'm on the latest stable: 3.14.2 (3.14.2-1-ARCH).

Hmm, OK. Can you confirm manual fan management works as expected?

I have just tried on my nvc4 and automatic fan management brings back my fan
speed to 40% from the 100% set manually.

As for your question about fan management being done by the hw or software, it
is always scaled in software (either in an RTOS running in the card or in the
kernel driver). In the fermi family, the first chipsets were actually using a
dedicated hardware chip for fan management (ADT7473) but your card is not one
of them. So, in our case, we run the code in the linux kernel but it will be
moved to the RTOS when I'm done pushing my patches to fix timers and when I
take the time to write the code for fan management.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399152714.Cc3A2.29011
Date: Sat, 3 May 2014 21:31:54 +0000
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
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78116#c2">comment #2</a>)
<span class="quote">&gt; I'm using Arch Linux so I'm on the latest stable: 3.14.2 (3.14.2-1-ARCH).</span >

Hmm, OK. Can you confirm manual fan management works as expected?

I have just tried on my nvc4 and automatic fan management brings back my fan
speed to 40% from the 100% set manually.

As for your question about fan management being done by the hw or software, it
is always scaled in software (either in an RTOS running in the card or in the
kernel driver). In the fermi family, the first chipsets were actually using a
dedicated hardware chip for fan management (ADT7473) but your card is not one
of them. So, in our case, we run the code in the linux kernel but it will be
moved to the RTOS when I'm done pushing my patches to fix timers and when I
take the time to write the code for fan management.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399152714.Cc3A2.29011--

--===============1229123407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1229123407==--
