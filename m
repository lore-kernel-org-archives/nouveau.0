From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77857] Second Monitor Stopped Working
Date: Thu, 24 Apr 2014 04:35:45 +0000
Message-ID: <bug-77857-8800-r2jT3xCz9D@http.bugs.freedesktop.org/>
References: <bug-77857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1725216616=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1725216616==
Content-Type: multipart/alternative; boundary="1398314145.Aa34811.8207"; charset="us-ascii"


--1398314145.Aa34811.8207
Date: Thu, 24 Apr 2014 04:35:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77857

--- Comment #10 from eagle_boy-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org ---
I ran the modprobe and I got.

libkmod: ERROR ../libkmod/libkmod-module.c: 791 kmod_module_insert_module:
could not find module by name='off'
ERROR: could not insert 'off': Function not implemented.

I uninstalled (or at least assumed it was uninstalled after running the the
bin's remove option) so I wonder why it' still showing. I will double check
with my package manager to see if the script missed something.

As for not having GeForce 9800 GTX, I do have that card install I wonder why
it's detecting it as GTX 650 (I wonder if they have the same chipset).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398314145.Aa34811.8207
Date: Thu, 24 Apr 2014 04:35:45 +0000
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
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857">bug 77857</a>
              from <span class="vcard"><a class="email" href="mailto:eagle_boy&#64;rocketmail.com" title="eagle_boy&#64;rocketmail.com">eagle_boy&#64;rocketmail.com</a>
</span></b>
        <pre>I ran the modprobe and I got.

libkmod: ERROR ../libkmod/libkmod-module.c: 791 kmod_module_insert_module:
could not find module by name='off'
ERROR: could not insert 'off': Function not implemented.

I uninstalled (or at least assumed it was uninstalled after running the the
bin's remove option) so I wonder why it' still showing. I will double check
with my package manager to see if the script missed something.

As for not having GeForce 9800 GTX, I do have that card install I wonder why
it's detecting it as GTX 650 (I wonder if they have the same chipset).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398314145.Aa34811.8207--

--===============1725216616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1725216616==--
