From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78106] Reported fan rpm is twice the actual value
	(NVC0)
Date: Wed, 30 Apr 2014 10:29:01 +0000
Message-ID: <bug-78106-8800-TODVfLJRp7@http.bugs.freedesktop.org/>
References: <bug-78106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1810224727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1810224727==
Content-Type: multipart/alternative; boundary="1398853741.d42DFD1.16185"; charset="us-ascii"


--1398853741.d42DFD1.16185
Date: Wed, 30 Apr 2014 10:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78106

--- Comment #3 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ---
Created attachment 98232
  --> https://bugs.freedesktop.org/attachment.cgi?id=98232&action=edit
Bioses

I'm attaching original bios for my card (1), bios which I modified and flashed
under Windows (2) and the dumped one (3).
All three seem to differ so I'm attaching them all. I hope that modifying of
bios (lower min fan threshold from 40 to 30) is not causing this issue. Let me
know if you need me to verify it with stock bios. You have all the bioses but I
can verify it if it's too much trouble looking in the bios rom. I just hate
noise ;)

Thanks for looking into it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398853741.d42DFD1.16185
Date: Wed, 30 Apr 2014 10:29:01 +0000
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
   title="NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106">bug 78106</a>
              from <span class="vcard"><a class="email" href="mailto:mdop&#64;seznam.cz" title="Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <span class="fn">Marcel Dopita</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=98232" name="attach_98232" title="Bioses">attachment 98232</a> <a href="attachment.cgi?id=98232&amp;action=edit" title="Bioses">[details]</a></span>
Bioses

I'm attaching original bios for my card (1), bios which I modified and flashed
under Windows (2) and the dumped one (3).
All three seem to differ so I'm attaching them all. I hope that modifying of
bios (lower min fan threshold from 40 to 30) is not causing this issue. Let me
know if you need me to verify it with stock bios. You have all the bioses but I
can verify it if it's too much trouble looking in the bios rom. I just hate
noise ;)

Thanks for looking into it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398853741.d42DFD1.16185--

--===============1810224727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1810224727==--
