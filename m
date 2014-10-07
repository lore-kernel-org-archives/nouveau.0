From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84741] [NV46] nouveau can't find VBIOS
Date: Tue, 07 Oct 2014 17:32:26 +0000
Message-ID: <bug-84741-8800-Z8LiVqMHpP@http.bugs.freedesktop.org/>
References: <bug-84741-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1225956075=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84741-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1225956075==
Content-Type: multipart/alternative; boundary="1412703146.0eeF81.11579"; charset="UTF-8"


--1412703146.0eeF81.11579
Date: Tue, 7 Oct 2014 17:32:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84741

--- Comment #2 from Germano Massullo <germano.massullo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 107513
  --> https://bugs.freedesktop.org/attachment.cgi?id=107513&action=edit
dmesg using nouveau.config=VBIOS=PRAMIN

# cat /proc/cmdline BOOT_IMAGE=/boot/vmlinuz-3.16.3-200.fc20.x86_64
root=UUID=d8b272ae-a143-4600-9f50-7a5b31c35293 ro
vconsole.font=latarcyrheb-sun16 nouveau.config=VBIOS=PRAMIN LANG=it_IT.UTF-8

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412703146.0eeF81.11579
Date: Tue, 7 Oct 2014 17:32:26 +0000
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
   title="NEW - [NV46] nouveau can't find VBIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84741#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] nouveau can't find VBIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84741">bug 84741</a>
              from <span class="vcard"><a class="email" href="mailto:germano.massullo&#64;gmail.com" title="Germano Massullo &lt;germano.massullo&#64;gmail.com&gt;"> <span class="fn">Germano Massullo</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=107513" name="attach_107513" title="dmesg using nouveau.config=VBIOS=PRAMIN">attachment 107513</a> <a href="attachment.cgi?id=107513&amp;action=edit" title="dmesg using nouveau.config=VBIOS=PRAMIN">[details]</a></span>
dmesg using nouveau.config=VBIOS=PRAMIN

# cat /proc/cmdline BOOT_IMAGE=/boot/vmlinuz-3.16.3-200.fc20.x86_64
root=UUID=d8b272ae-a143-4600-9f50-7a5b31c35293 ro
vconsole.font=latarcyrheb-sun16 nouveau.config=VBIOS=PRAMIN LANG=it_IT.UTF-8</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412703146.0eeF81.11579--

--===============1225956075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1225956075==--
