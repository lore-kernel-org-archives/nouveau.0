From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84101] [NV96] null deref in nouveau_i2c_acquire_pad,
 triggered by xcmddc
Date: Sun, 21 Sep 2014 09:04:58 +0000
Message-ID: <bug-84101-8800-pWUuHF8BtC@http.bugs.freedesktop.org/>
References: <bug-84101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0022785250=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0022785250==
Content-Type: multipart/alternative; boundary="1411290298.afedBd7D1.25855"; charset="us-ascii"


--1411290298.afedBd7D1.25855
Date: Sun, 21 Sep 2014 09:04:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84101

--- Comment #2 from danny_archer-97jfqw80gc6171pxa8y+qA@public.gmane.org ---
Created attachment 106600
  --> https://bugs.freedesktop.org/attachment.cgi?id=106600&action=edit
kern.log

It happened again. I was able to log in over ssh and poweroff the machine. The
consequent boot went without any issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411290298.afedBd7D1.25855
Date: Sun, 21 Sep 2014 09:04:58 +0000
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
   title="NEW --- - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101">bug 84101</a>
              from <span class="vcard"><a class="email" href="mailto:danny_archer&#64;fastmail.fm" title="danny_archer&#64;fastmail.fm">danny_archer&#64;fastmail.fm</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=106600" name="attach_106600" title="kern.log">attachment 106600</a> <a href="attachment.cgi?id=106600&amp;action=edit" title="kern.log">[details]</a></span>
kern.log

It happened again. I was able to log in over ssh and poweroff the machine. The
consequent boot went without any issues.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411290298.afedBd7D1.25855--

--===============0022785250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0022785250==--
