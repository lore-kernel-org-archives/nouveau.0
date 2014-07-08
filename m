From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Tue, 08 Jul 2014 12:41:47 +0000
Message-ID: <bug-80901-8800-abtQ1pKd2s@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0065345515=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0065345515==
Content-Type: multipart/alternative; boundary="1404823307.D8431.6513"; charset="us-ascii"


--1404823307.D8431.6513
Date: Tue, 8 Jul 2014 12:41:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #13 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Comment on attachment 102433
  --> https://bugs.freedesktop.org/attachment.cgi?id=102433
PATCH: add LINEAR_MIN and LINEAR_MAX to sysfs

Thanks, this patch is perfectly sound!

However, it doesn't follow the sysfs interface of hwmon as defined here:
https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface

I don't particularly like this interface, but I've tried to stay as close to it
as possible. One possibility could be to use the trip points to expose
linear_min/max, however, we would be bending the definition of trip point by a
long shot (we are not supposed to scale linearly between trip points, at least
that's how NVIDIA defines trip points, that's a question worth asking to the
hwmon guys).

If we are to keep your patch more or less intact, you would have to move your
the end result to nouveau_sysfs.c. You would also need to change the name to
temp1_fan_linear_min/max, to improve the clarity of what values are expected in
there :) Finally, you would need to update the documentation
(http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/thermal/nouveau_thermal).

Thanks again for your interest in fixing this!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404823307.D8431.6513
Date: Tue, 8 Jul 2014 12:41:47 +0000
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
   title="NEW --- - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Comment on <span class=""><a href="attachment.cgi?id=102433" name="attach_102433" title="PATCH: add LINEAR_MIN and LINEAR_MAX to sysfs">attachment 102433</a> <a href="attachment.cgi?id=102433&amp;action=edit" title="PATCH: add LINEAR_MIN and LINEAR_MAX to sysfs">[details]</a></span>
PATCH: add LINEAR_MIN and LINEAR_MAX to sysfs

Thanks, this patch is perfectly sound!

However, it doesn't follow the sysfs interface of hwmon as defined here:
<a href="https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface">https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface</a>

I don't particularly like this interface, but I've tried to stay as close to it
as possible. One possibility could be to use the trip points to expose
linear_min/max, however, we would be bending the definition of trip point by a
long shot (we are not supposed to scale linearly between trip points, at least
that's how NVIDIA defines trip points, that's a question worth asking to the
hwmon guys).

If we are to keep your patch more or less intact, you would have to move your
the end result to nouveau_sysfs.c. You would also need to change the name to
temp1_fan_linear_min/max, to improve the clarity of what values are expected in
there :) Finally, you would need to update the documentation
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/thermal/nouveau_thermal">http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/thermal/nouveau_thermal</a>).

Thanks again for your interest in fixing this!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404823307.D8431.6513--

--===============0065345515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0065345515==--
