From: Brian Paul <brianp@vmware.com>
Subject: Re: [PATCH 09/21] nouveau: Add support for
	ARB_sampler_object
Date: Mon, 11 Jun 2012 09:38:10 -0600
Message-ID: <4FD610E2.8030601@vmware.com>
References: <1339397983-31219-1-git-send-email-pauli.nieminen@linux.intel.com>
	<1339397983-31219-18-git-send-email-pauli.nieminen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1339397983-31219-18-git-send-email-pauli.nieminen@linux.intel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Pauli Nieminen <pauli.nieminen@linux.intel.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 06/11/2012 12:59 AM, Pauli Nieminen wrote:
> ARB_sampler_object is very simple software only extension to support.
> I want to make it mandator extension for Mesa drivers to allow meta
> module to use it.
>
> This patch add support for the extension to nouveau. It is completely
> untested search and replace patch. I hope someone with old NV hardware
> could give a try that there is no regressions and ARB_sampler_object
> tests passes.
>
> Signed-off-by: Pauli Nieminen<pauli.nieminen@linux.intel.com>
> CC: nouveau@lists.freedesktop.org

Looks OK to me.

Reviewed-by: Brian Paul <brianp@vmware.com>
