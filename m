From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77378] [NVD9] Suspend from resume fails when using
	gnome+compiz
Date: Mon, 14 Apr 2014 09:15:14 +0000
Message-ID: <bug-77378-8800-3NNK0v5Izc@http.bugs.freedesktop.org/>
References: <bug-77378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239440318=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0239440318==
Content-Type: multipart/alternative; boundary="1397466914.c6AA0.30946"; charset="us-ascii"


--1397466914.c6AA0.30946
Date: Mon, 14 Apr 2014 09:15:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77378

--- Comment #8 from s.brisbane1-JAjqph6Yjy8XSZKaUYBEcQ@public.gmane.org ---
glxinfo refused to generate.  
dmesg is attached.
glxinfo -display :0 fails

Tried using the binary blob.  Will need some help adding to initrd.  

Without adding to initrd, the system booted but the display was messed up.  Was
usable enough to work out where the login box was, so I logged in. After
suspend/resume there was no display and the laptop started beeping (kernel
panic?). So I have no dmesg for you to help debug that one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397466914.c6AA0.30946
Date: Mon, 14 Apr 2014 09:15:14 +0000
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
   title="NEW --- - [NVD9] Suspend from resume fails when using gnome+compiz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77378#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Suspend from resume fails when using gnome+compiz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77378">bug 77378</a>
              from <span class="vcard"><a class="email" href="mailto:s.brisbane1&#64;physics.ox.ac.uk" title="s.brisbane1&#64;physics.ox.ac.uk">s.brisbane1&#64;physics.ox.ac.uk</a>
</span></b>
        <pre>glxinfo refused to generate.  
dmesg is attached.
glxinfo -display :0 fails

Tried using the binary blob.  Will need some help adding to initrd.  

Without adding to initrd, the system booted but the display was messed up.  Was
usable enough to work out where the login box was, so I logged in. After
suspend/resume there was no display and the laptop started beeping (kernel
panic?). So I have no dmesg for you to help debug that one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397466914.c6AA0.30946--

--===============0239440318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0239440318==--
