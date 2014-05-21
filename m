From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 02/12] nv50: setup scissors on
	clear_render_target/depth_stencil
Date: Wed, 21 May 2014 20:06:40 +0100
Message-ID: <537CF940.7030100@gmail.com>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>	<1400629206-4447-3-git-send-email-imirkin@alum.mit.edu>	<537CF70A.4000905@gmail.com>
 <CAKb7UviDcjazdQv3S7zz=+eTT1JziWrUCVuYxsSFFmQn3kSMnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UviDcjazdQv3S7zz=+eTT1JziWrUCVuYxsSFFmQn3kSMnA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, emil.l.velikov@gmail.com, "10.2" <mesa-stable@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 21/05/14 19:59, Ilia Mirkin wrote:
> On Wed, May 21, 2014 at 2:57 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>> On 21/05/14 00:39, Ilia Mirkin wrote:
>>> From: Christoph Bumiller <e0425955@student.tuwien.ac.at>
>>>
>>> [imirkin: add logic to also clear the "regular" scissors]
>> Can you please share why are you've added the "regular" scissors ?
> 
> Because I had to when I was implementing the clear_texture and
> clear_buffer hooks (clear_texture didn't end up making it in quite yet
> because I suck at writing piglit tests, but clear_buffer is there
> now). Basically if scissors are set, they will apply to the clear,
> which is not what we want.
> 
>> Does it matter if we set the screen scissors before the render target params?
> 
> AFAIK, with the exception of a few "go" methods, you can pretty much
> randomize the order in which you set all parameters.
> 

Great, thank you.
